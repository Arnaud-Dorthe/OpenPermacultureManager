class RenameUsagesOfAccountsRemovedInPreferedAccountingSystem < ActiveRecord::Migration
    ACCOUNTS = [
   {name: "long_time_animal_stock", fr_pcga: "31", fr_pcg82: "NONE"},
   {name: "raw_material_and_supplies", fr_pcga: "NONE", fr_pcg82: "31"},
   {name: "short_time_animal_stock", fr_pcga: "32", fr_pcg82: "NONE"},
   {name: "other_supplies", fr_pcga: "NONE", fr_pcg82: "32"},
   {name: "long_cycle_vegetals_stock", fr_pcga: "33", fr_pcg82: "NONE"},
   {name: "in_cycle_products_stock", fr_pcga: "NONE", fr_pcg82: "33"},
   {name: "short_cycle_vegetals_stock", fr_pcga: "34", fr_pcg82: "NONE"},
   {name: "in_cycle_services_stock", fr_pcga: "NONE", fr_pcg82: "34"},
   {name: "long_cycle_products_stock", fr_pcga: "35", fr_pcg82: "NONE"},
   {name: "products_stock", fr_pcga: "NONE", fr_pcg82: "35"},
   {name: "short_cycle_products_stock", fr_pcga: "36", fr_pcg82: "NONE"},
   {name: "assets_products_stock", fr_pcga: "NONE", fr_pcg82: "36"},
   {name: "end_products_stock", fr_pcga: "37", fr_pcg82: "NONE"},
   {name: "merchandising_products_stock", fr_pcga: "NONE", fr_pcg82: "37"},
   {name: "social_security", fr_pcga: "431", fr_pcg82: "NONE"},
   {name: "social_agricultural_mutuality", fr_pcga: "NONE", fr_pcg82: "431"},
   {name: "making_services_expenses", fr_pcga: "605", fr_pcg82: "NONE"},
   {name: "equipment_expenses", fr_pcga: "NONE", fr_pcg82: "605"},
   {name: "bonus_staff_expenses", fr_pcga: "6413", fr_pcg82: "NONE"},
   {name: "associates_salary", fr_pcga: "NONE", fr_pcg82: "6413"}]
  def change
    reversible do |d|
      d.up do
        accounting_systems = [:fr_pcg82, :fr_pcga]
        current_accounting_system = Preference[:accounting_system].to_sym
        accounts_to_update = ACCOUNTS.select { |account| account[current_accounting_system] == "NONE"}.compact
        accounts_to_update.each do |account|
          filter_accounting_system = (accounting_systems - [current_accounting_system]).first
          new_usage = ACCOUNTS.map { |a| a.slice(:name) if a[current_accounting_system] == account[filter_accounting_system] }.compact.first[:name]
          execute <<-SQL
            UPDATE accounts
            SET usages = '#{new_usage}'
            WHERE usages = '#{account[:name]}'
          SQL
        end
      end

      d.down do
        # NOOP
      end
    end
  end
end
