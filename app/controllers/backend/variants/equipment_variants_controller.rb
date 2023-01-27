module Backend
  module Variants
    class EquipmentVariantsController < Backend::ProductNatureVariantsController
      importable_from_lexicon :master_variants, model_name: "Variants::#{controller_name.classify}".constantize,
                                                primary_key: :reference_name,
                                                filters: { of_families: :equipment },
                                                notify: { success: :equipment_has_been_imported }
    end
  end
end
