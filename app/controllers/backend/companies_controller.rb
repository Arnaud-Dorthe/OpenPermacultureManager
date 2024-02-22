module Backend
  class CompaniesController < Backend::BaseController
    before_action :set_preferences, only: %i[edit]

    def edit
      notify_mandatory_informations
      Preference.check!
      @company = Entity.of_company
      @have_journal_entries = JournalEntry.any?
      @url_params = build_attributes_for_weather
    end

    def set_station_as_default
      if params[:station_id]
        Preference.set!(:weather_public_station, params[:station_id], :string)
        station = RegisteredWeatherStation.find_by(reference_name: params[:station_id])
        notify_success(:station_set_as_default, station_id: station.name)
        redirect_to params[:redirect] || { action: :edit }
      else
        notify_error(:no_station_id_present)
        redirect_to params[:redirect] || { action: :edit }
      end
    end

    def build_attributes_for_weather
      company = Entity.of_company
      mail_address = company.default_mail_address
      postal_code = mail_address.mail_postal_zone.postal_code
      country = mail_address.mail_postal_zone.country
      country ||= Preference[:country]
      if mail_address.mail_geolocation
        centroid = mail_address.mail_geolocation
      elsif CultivableZone.any?
        c = CultivableZone.first.shape_centroid
        centroid = ::Charta.new_point(c[0], c[1])
      end
      if postal_code.present? && country.present?
        stations = RegisteredWeatherStation.of_country(country).of_country_zone(postal_code[0..1])
      elsif country.present?
        stations = RegisteredWeatherStation.of_country(country)
      end
      { station_ids: stations.pluck(:reference_name), shape_centroid: centroid }
    end

    def update
      ApplicationRecord.transaction do
        # Update company
        @company = Entity.of_company
        @company.update_attributes(permitted_params[:entity])
        @company.nature = :organization
        @company.save!
        @url_params = build_attributes_for_weather
        # Update preferences
        params[:preferences].each do |key, data|
          preference = Preference.get!(key)
          preference.reload
          if key == 'currency'
            gc = GlobalCurrency.new(preference.value)
            if preference.value.to_s != data[:value]
              rate = params[:currency_change_rate].to_i
              raise 'Cannot proceed with null rate' if rate.zero?

              gc.convert_to(data[:value], rate: rate)
            end
          end
          # This is a nasty hack to use the type coercion of Preference in order to be able to compare values from the form and values inside the Preferences
          old_value = preference.value
          preference.value = data[:value]

          if old_value != preference.value # Here, preference.value is the 'new value'
            preference.save!
            preference_changed(preference, preference.value)
          end
        end
      end
      set_preferences
      render :edit
    end

    protected

      def notify_mandatory_informations
        @company = Entity.of_company
        return if @company.siren_number.empty?

        url = "https://societe.ninja/data.php?siren=#{@company.siren_number.to_s}"

        notify_now(:check_mandatory_company_informations_x, x: helpers.link_to(@company.siren_number.to_s, url, target: :_blank), html: true)
      end

      def permitted_params
        params.permit!
      end

      #  Called after each change in a preference when updating the company
      # @param [Preference] preference
      # @param [Object] new_value
      def preference_changed(preference, new_value)
        account_number_digits_changed(new_value.to_i) if preference.name == "account_number_digits"
      end

      def set_preferences
        global_preferences = Preference.global
        @lang_preference = global_preferences.get("language")
        @d_d_m_preference = Preference.get("default_depreciation_period", 'yearly', :string)
        @a_n_preference = global_preferences.get("account_number_digits")
        @s_c_preference = global_preferences.get("sales_conditions")
      end

      # Called after each change of the preference :account_number:digits when updating the company
      # @param [Integer] new_value
      def account_number_digits_changed(new_value)
        return if JournalEntry.any?

        n = Accountancy::AccountNumberNormalizer.build(standard_length: new_value)

        errors = Account.where.not(nature: "auxiliary")
                        .map { |acc| normalize_account(acc, normalizer: n) }
                        .select(&:is_some?)
                        .map(&:get)

        if errors.any?
          notify_error_now(
            :accounts_cannot_be_truncated_to_preference,
            accounts: errors.map(&:number).join(', '),
            preference: errors.first.standard_length,
            count: errors.size
          )

          raise ActiveRecord::Rollback
        end
      end

      # @todo use a Result type when available
      # @param [Account] account
      # @param [Accountancy::AccountNumberNormalizer] normalizer
      # @return [Maybe<Accountancy::AccountNumberNormalizer::NormalizationError>]
      def normalize_account(account, normalizer:)
        account.update(number: normalizer.normalize!(account.number))
        None()
      rescue Accountancy::AccountNumberNormalizer::NormalizationError => e
        return Some(e)
      end
  end
end
