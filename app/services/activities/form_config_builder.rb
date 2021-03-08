# frozen_string_literal: true

module Activities
  class FormConfigBuilder
    class << self
      def build
        builder = new(
          default: {
            inspections: true,
            countings: true,
            distributions: true,
            seasons: true,
            tactics: true,
            production_nature: {
              display_style: 'none'
            },
            start_state_of_production: {
              display_style: 'block',
              required: false
            },
            life_duration: {
              display_style: 'none',
              required: false
            }

          },
          animal_farming: {
            start_state_of_production: {
              display_style: 'block'
            },
          },
          tool_maintaining: {
            cultivation_variety: {
              display_style: 'block',
            }
          },
        )
        ActiveSupport::Notifications.instrument "activities.form_config_builder.build", builder: builder

        builder
      end
    end

    def initialize(configs)
      @configs = configs.with_indifferent_access
    end

    def register_config(family, config)
      configs[family] = config
    end

    def config_for(family)
      as_struct(
        merge(configs.fetch(:default), configs.fetch(family, {}))
      )
    end

    private

      attr_reader :configs

      def merge(base, other)
        base.map do |key, value|
          if value.is_a?(Hash)
            [key, merge(value, other.fetch(key, {})).to_h]
          else
            [key, other.fetch(key, value)]
          end
        end.to_h
      end

      def as_struct(config)
        JSON.parse config.to_json, object_class: OpenStruct
      end
  end
end