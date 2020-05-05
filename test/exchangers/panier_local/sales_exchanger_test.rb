require 'test_helper'

module PanierLocal
  class SalesExchangerTest < ActiveExchanger::TestCase
    setup do
      # We wan't to keep tracking of import resource
      @import = Import.create!(nature: :panier_local_sales)

      I18n.locale = :fra
    end
    test 'import' do
      result = PanierLocal::SalesExchanger.build(fixture_files_path.join('imports', 'panier_local', 'panier_local_sales.csv'), options: { import_id: @import.id }).run
      assert result.success?, [result.message, result.exception]
      assert_equal 45, SaleNature.find_by(name: "Vente en ligne - Panier Local").sales.count
    end

    teardown do
      @import.destroy!
    end
  end
end
