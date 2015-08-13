# Migration generated with nomenclature migration #2
class FixZea < ActiveRecord::Migration
  def up
    # Change item varieties#zea_aallexia with new name zea_mays_aallexia, new parent zea_mays and new itis_tsn 
    execute "UPDATE activities SET cultivation_variety='zea_mays_aallexia' WHERE cultivation_variety='zea_aallexia'"
    execute "UPDATE activities SET support_variety='zea_mays_aallexia' WHERE support_variety='zea_aallexia'"
    execute "UPDATE products SET variety='zea_mays_aallexia' WHERE variety='zea_aallexia'"
    execute "UPDATE products SET derivative_of='zea_mays_aallexia' WHERE derivative_of='zea_aallexia'"
    execute "UPDATE product_nature_variants SET variety='zea_mays_aallexia' WHERE variety='zea_aallexia'"
    execute "UPDATE product_nature_variants SET derivative_of='zea_mays_aallexia' WHERE derivative_of='zea_aallexia'"
    execute "UPDATE manure_management_plan_zones SET cultivation_variety='zea_mays_aallexia' WHERE cultivation_variety='zea_aallexia'"
    execute "UPDATE product_natures SET variety='zea_mays_aallexia' WHERE variety='zea_aallexia'"
    execute "UPDATE product_natures SET derivative_of='zea_mays_aallexia' WHERE derivative_of='zea_aallexia'"
    # Change item varieties#zea_boomer with new name zea_mays_boomer, new parent zea_mays and new itis_tsn 
    execute "UPDATE activities SET cultivation_variety='zea_mays_boomer' WHERE cultivation_variety='zea_boomer'"
    execute "UPDATE activities SET support_variety='zea_mays_boomer' WHERE support_variety='zea_boomer'"
    execute "UPDATE products SET variety='zea_mays_boomer' WHERE variety='zea_boomer'"
    execute "UPDATE products SET derivative_of='zea_mays_boomer' WHERE derivative_of='zea_boomer'"
    execute "UPDATE product_nature_variants SET variety='zea_mays_boomer' WHERE variety='zea_boomer'"
    execute "UPDATE product_nature_variants SET derivative_of='zea_mays_boomer' WHERE derivative_of='zea_boomer'"
    execute "UPDATE manure_management_plan_zones SET cultivation_variety='zea_mays_boomer' WHERE cultivation_variety='zea_boomer'"
    execute "UPDATE product_natures SET variety='zea_mays_boomer' WHERE variety='zea_boomer'"
    execute "UPDATE product_natures SET derivative_of='zea_mays_boomer' WHERE derivative_of='zea_boomer'"
    # Change item varieties#zea_bergxxon with new name zea_mays_bergxxon, new parent zea_mays and new itis_tsn 
    execute "UPDATE activities SET cultivation_variety='zea_mays_bergxxon' WHERE cultivation_variety='zea_bergxxon'"
    execute "UPDATE activities SET support_variety='zea_mays_bergxxon' WHERE support_variety='zea_bergxxon'"
    execute "UPDATE products SET variety='zea_mays_bergxxon' WHERE variety='zea_bergxxon'"
    execute "UPDATE products SET derivative_of='zea_mays_bergxxon' WHERE derivative_of='zea_bergxxon'"
    execute "UPDATE product_nature_variants SET variety='zea_mays_bergxxon' WHERE variety='zea_bergxxon'"
    execute "UPDATE product_nature_variants SET derivative_of='zea_mays_bergxxon' WHERE derivative_of='zea_bergxxon'"
    execute "UPDATE manure_management_plan_zones SET cultivation_variety='zea_mays_bergxxon' WHERE cultivation_variety='zea_bergxxon'"
    execute "UPDATE product_natures SET variety='zea_mays_bergxxon' WHERE variety='zea_bergxxon'"
    execute "UPDATE product_natures SET derivative_of='zea_mays_bergxxon' WHERE derivative_of='zea_bergxxon'"
    # Change item varieties#zea_dkc3912 with new name zea_mays_dkc3912, new parent zea_mays and new itis_tsn 
    execute "UPDATE activities SET cultivation_variety='zea_mays_dkc3912' WHERE cultivation_variety='zea_dkc3912'"
    execute "UPDATE activities SET support_variety='zea_mays_dkc3912' WHERE support_variety='zea_dkc3912'"
    execute "UPDATE products SET variety='zea_mays_dkc3912' WHERE variety='zea_dkc3912'"
    execute "UPDATE products SET derivative_of='zea_mays_dkc3912' WHERE derivative_of='zea_dkc3912'"
    execute "UPDATE product_nature_variants SET variety='zea_mays_dkc3912' WHERE variety='zea_dkc3912'"
    execute "UPDATE product_nature_variants SET derivative_of='zea_mays_dkc3912' WHERE derivative_of='zea_dkc3912'"
    execute "UPDATE manure_management_plan_zones SET cultivation_variety='zea_mays_dkc3912' WHERE cultivation_variety='zea_dkc3912'"
    execute "UPDATE product_natures SET variety='zea_mays_dkc3912' WHERE variety='zea_dkc3912'"
    execute "UPDATE product_natures SET derivative_of='zea_mays_dkc3912' WHERE derivative_of='zea_dkc3912'"
    # Change item varieties#zea_lg30533 with new name zea_mays_lg30533, new parent zea_mays and new itis_tsn 
    execute "UPDATE activities SET cultivation_variety='zea_mays_lg30533' WHERE cultivation_variety='zea_lg30533'"
    execute "UPDATE activities SET support_variety='zea_mays_lg30533' WHERE support_variety='zea_lg30533'"
    execute "UPDATE products SET variety='zea_mays_lg30533' WHERE variety='zea_lg30533'"
    execute "UPDATE products SET derivative_of='zea_mays_lg30533' WHERE derivative_of='zea_lg30533'"
    execute "UPDATE product_nature_variants SET variety='zea_mays_lg30533' WHERE variety='zea_lg30533'"
    execute "UPDATE product_nature_variants SET derivative_of='zea_mays_lg30533' WHERE derivative_of='zea_lg30533'"
    execute "UPDATE manure_management_plan_zones SET cultivation_variety='zea_mays_lg30533' WHERE cultivation_variety='zea_lg30533'"
    execute "UPDATE product_natures SET variety='zea_mays_lg30533' WHERE variety='zea_lg30533'"
    execute "UPDATE product_natures SET derivative_of='zea_mays_lg30533' WHERE derivative_of='zea_lg30533'"
    # Change item varieties#zea_lg3490 with new name zea_mays_lg3490, new parent zea_mays and new itis_tsn 
    execute "UPDATE activities SET cultivation_variety='zea_mays_lg3490' WHERE cultivation_variety='zea_lg3490'"
    execute "UPDATE activities SET support_variety='zea_mays_lg3490' WHERE support_variety='zea_lg3490'"
    execute "UPDATE products SET variety='zea_mays_lg3490' WHERE variety='zea_lg3490'"
    execute "UPDATE products SET derivative_of='zea_mays_lg3490' WHERE derivative_of='zea_lg3490'"
    execute "UPDATE product_nature_variants SET variety='zea_mays_lg3490' WHERE variety='zea_lg3490'"
    execute "UPDATE product_nature_variants SET derivative_of='zea_mays_lg3490' WHERE derivative_of='zea_lg3490'"
    execute "UPDATE manure_management_plan_zones SET cultivation_variety='zea_mays_lg3490' WHERE cultivation_variety='zea_lg3490'"
    execute "UPDATE product_natures SET variety='zea_mays_lg3490' WHERE variety='zea_lg3490'"
    execute "UPDATE product_natures SET derivative_of='zea_mays_lg3490' WHERE derivative_of='zea_lg3490'"
    # Change item varieties#zea_lg3530 with new name zea_mays_lg3530, new parent zea_mays and new itis_tsn 
    execute "UPDATE activities SET cultivation_variety='zea_mays_lg3530' WHERE cultivation_variety='zea_lg3530'"
    execute "UPDATE activities SET support_variety='zea_mays_lg3530' WHERE support_variety='zea_lg3530'"
    execute "UPDATE products SET variety='zea_mays_lg3530' WHERE variety='zea_lg3530'"
    execute "UPDATE products SET derivative_of='zea_mays_lg3530' WHERE derivative_of='zea_lg3530'"
    execute "UPDATE product_nature_variants SET variety='zea_mays_lg3530' WHERE variety='zea_lg3530'"
    execute "UPDATE product_nature_variants SET derivative_of='zea_mays_lg3530' WHERE derivative_of='zea_lg3530'"
    execute "UPDATE manure_management_plan_zones SET cultivation_variety='zea_mays_lg3530' WHERE cultivation_variety='zea_lg3530'"
    execute "UPDATE product_natures SET variety='zea_mays_lg3530' WHERE variety='zea_lg3530'"
    execute "UPDATE product_natures SET derivative_of='zea_mays_lg3530' WHERE derivative_of='zea_lg3530'"
    # Change item varieties#zea_shannon with new name zea_mays_shannon, new parent zea_mays and new itis_tsn 
    execute "UPDATE activities SET cultivation_variety='zea_mays_shannon' WHERE cultivation_variety='zea_shannon'"
    execute "UPDATE activities SET support_variety='zea_mays_shannon' WHERE support_variety='zea_shannon'"
    execute "UPDATE products SET variety='zea_mays_shannon' WHERE variety='zea_shannon'"
    execute "UPDATE products SET derivative_of='zea_mays_shannon' WHERE derivative_of='zea_shannon'"
    execute "UPDATE product_nature_variants SET variety='zea_mays_shannon' WHERE variety='zea_shannon'"
    execute "UPDATE product_nature_variants SET derivative_of='zea_mays_shannon' WHERE derivative_of='zea_shannon'"
    execute "UPDATE manure_management_plan_zones SET cultivation_variety='zea_mays_shannon' WHERE cultivation_variety='zea_shannon'"
    execute "UPDATE product_natures SET variety='zea_mays_shannon' WHERE variety='zea_shannon'"
    execute "UPDATE product_natures SET derivative_of='zea_mays_shannon' WHERE derivative_of='zea_shannon'"
  end

  def down
    # Reverse: Change item varieties#zea_shannon with new name zea_mays_shannon, new parent zea_mays and new itis_tsn 
    execute "UPDATE product_natures SET derivative_of='zea_shannon' WHERE derivative_of='zea_mays_shannon'"
    execute "UPDATE product_natures SET variety='zea_shannon' WHERE variety='zea_mays_shannon'"
    execute "UPDATE manure_management_plan_zones SET cultivation_variety='zea_shannon' WHERE cultivation_variety='zea_mays_shannon'"
    execute "UPDATE product_nature_variants SET derivative_of='zea_shannon' WHERE derivative_of='zea_mays_shannon'"
    execute "UPDATE product_nature_variants SET variety='zea_shannon' WHERE variety='zea_mays_shannon'"
    execute "UPDATE products SET derivative_of='zea_shannon' WHERE derivative_of='zea_mays_shannon'"
    execute "UPDATE products SET variety='zea_shannon' WHERE variety='zea_mays_shannon'"
    execute "UPDATE activities SET support_variety='zea_shannon' WHERE support_variety='zea_mays_shannon'"
    execute "UPDATE activities SET cultivation_variety='zea_shannon' WHERE cultivation_variety='zea_mays_shannon'"
    # Reverse: Change item varieties#zea_lg3530 with new name zea_mays_lg3530, new parent zea_mays and new itis_tsn 
    execute "UPDATE product_natures SET derivative_of='zea_lg3530' WHERE derivative_of='zea_mays_lg3530'"
    execute "UPDATE product_natures SET variety='zea_lg3530' WHERE variety='zea_mays_lg3530'"
    execute "UPDATE manure_management_plan_zones SET cultivation_variety='zea_lg3530' WHERE cultivation_variety='zea_mays_lg3530'"
    execute "UPDATE product_nature_variants SET derivative_of='zea_lg3530' WHERE derivative_of='zea_mays_lg3530'"
    execute "UPDATE product_nature_variants SET variety='zea_lg3530' WHERE variety='zea_mays_lg3530'"
    execute "UPDATE products SET derivative_of='zea_lg3530' WHERE derivative_of='zea_mays_lg3530'"
    execute "UPDATE products SET variety='zea_lg3530' WHERE variety='zea_mays_lg3530'"
    execute "UPDATE activities SET support_variety='zea_lg3530' WHERE support_variety='zea_mays_lg3530'"
    execute "UPDATE activities SET cultivation_variety='zea_lg3530' WHERE cultivation_variety='zea_mays_lg3530'"
    # Reverse: Change item varieties#zea_lg3490 with new name zea_mays_lg3490, new parent zea_mays and new itis_tsn 
    execute "UPDATE product_natures SET derivative_of='zea_lg3490' WHERE derivative_of='zea_mays_lg3490'"
    execute "UPDATE product_natures SET variety='zea_lg3490' WHERE variety='zea_mays_lg3490'"
    execute "UPDATE manure_management_plan_zones SET cultivation_variety='zea_lg3490' WHERE cultivation_variety='zea_mays_lg3490'"
    execute "UPDATE product_nature_variants SET derivative_of='zea_lg3490' WHERE derivative_of='zea_mays_lg3490'"
    execute "UPDATE product_nature_variants SET variety='zea_lg3490' WHERE variety='zea_mays_lg3490'"
    execute "UPDATE products SET derivative_of='zea_lg3490' WHERE derivative_of='zea_mays_lg3490'"
    execute "UPDATE products SET variety='zea_lg3490' WHERE variety='zea_mays_lg3490'"
    execute "UPDATE activities SET support_variety='zea_lg3490' WHERE support_variety='zea_mays_lg3490'"
    execute "UPDATE activities SET cultivation_variety='zea_lg3490' WHERE cultivation_variety='zea_mays_lg3490'"
    # Reverse: Change item varieties#zea_lg30533 with new name zea_mays_lg30533, new parent zea_mays and new itis_tsn 
    execute "UPDATE product_natures SET derivative_of='zea_lg30533' WHERE derivative_of='zea_mays_lg30533'"
    execute "UPDATE product_natures SET variety='zea_lg30533' WHERE variety='zea_mays_lg30533'"
    execute "UPDATE manure_management_plan_zones SET cultivation_variety='zea_lg30533' WHERE cultivation_variety='zea_mays_lg30533'"
    execute "UPDATE product_nature_variants SET derivative_of='zea_lg30533' WHERE derivative_of='zea_mays_lg30533'"
    execute "UPDATE product_nature_variants SET variety='zea_lg30533' WHERE variety='zea_mays_lg30533'"
    execute "UPDATE products SET derivative_of='zea_lg30533' WHERE derivative_of='zea_mays_lg30533'"
    execute "UPDATE products SET variety='zea_lg30533' WHERE variety='zea_mays_lg30533'"
    execute "UPDATE activities SET support_variety='zea_lg30533' WHERE support_variety='zea_mays_lg30533'"
    execute "UPDATE activities SET cultivation_variety='zea_lg30533' WHERE cultivation_variety='zea_mays_lg30533'"
    # Reverse: Change item varieties#zea_dkc3912 with new name zea_mays_dkc3912, new parent zea_mays and new itis_tsn 
    execute "UPDATE product_natures SET derivative_of='zea_dkc3912' WHERE derivative_of='zea_mays_dkc3912'"
    execute "UPDATE product_natures SET variety='zea_dkc3912' WHERE variety='zea_mays_dkc3912'"
    execute "UPDATE manure_management_plan_zones SET cultivation_variety='zea_dkc3912' WHERE cultivation_variety='zea_mays_dkc3912'"
    execute "UPDATE product_nature_variants SET derivative_of='zea_dkc3912' WHERE derivative_of='zea_mays_dkc3912'"
    execute "UPDATE product_nature_variants SET variety='zea_dkc3912' WHERE variety='zea_mays_dkc3912'"
    execute "UPDATE products SET derivative_of='zea_dkc3912' WHERE derivative_of='zea_mays_dkc3912'"
    execute "UPDATE products SET variety='zea_dkc3912' WHERE variety='zea_mays_dkc3912'"
    execute "UPDATE activities SET support_variety='zea_dkc3912' WHERE support_variety='zea_mays_dkc3912'"
    execute "UPDATE activities SET cultivation_variety='zea_dkc3912' WHERE cultivation_variety='zea_mays_dkc3912'"
    # Reverse: Change item varieties#zea_bergxxon with new name zea_mays_bergxxon, new parent zea_mays and new itis_tsn 
    execute "UPDATE product_natures SET derivative_of='zea_bergxxon' WHERE derivative_of='zea_mays_bergxxon'"
    execute "UPDATE product_natures SET variety='zea_bergxxon' WHERE variety='zea_mays_bergxxon'"
    execute "UPDATE manure_management_plan_zones SET cultivation_variety='zea_bergxxon' WHERE cultivation_variety='zea_mays_bergxxon'"
    execute "UPDATE product_nature_variants SET derivative_of='zea_bergxxon' WHERE derivative_of='zea_mays_bergxxon'"
    execute "UPDATE product_nature_variants SET variety='zea_bergxxon' WHERE variety='zea_mays_bergxxon'"
    execute "UPDATE products SET derivative_of='zea_bergxxon' WHERE derivative_of='zea_mays_bergxxon'"
    execute "UPDATE products SET variety='zea_bergxxon' WHERE variety='zea_mays_bergxxon'"
    execute "UPDATE activities SET support_variety='zea_bergxxon' WHERE support_variety='zea_mays_bergxxon'"
    execute "UPDATE activities SET cultivation_variety='zea_bergxxon' WHERE cultivation_variety='zea_mays_bergxxon'"
    # Reverse: Change item varieties#zea_boomer with new name zea_mays_boomer, new parent zea_mays and new itis_tsn 
    execute "UPDATE product_natures SET derivative_of='zea_boomer' WHERE derivative_of='zea_mays_boomer'"
    execute "UPDATE product_natures SET variety='zea_boomer' WHERE variety='zea_mays_boomer'"
    execute "UPDATE manure_management_plan_zones SET cultivation_variety='zea_boomer' WHERE cultivation_variety='zea_mays_boomer'"
    execute "UPDATE product_nature_variants SET derivative_of='zea_boomer' WHERE derivative_of='zea_mays_boomer'"
    execute "UPDATE product_nature_variants SET variety='zea_boomer' WHERE variety='zea_mays_boomer'"
    execute "UPDATE products SET derivative_of='zea_boomer' WHERE derivative_of='zea_mays_boomer'"
    execute "UPDATE products SET variety='zea_boomer' WHERE variety='zea_mays_boomer'"
    execute "UPDATE activities SET support_variety='zea_boomer' WHERE support_variety='zea_mays_boomer'"
    execute "UPDATE activities SET cultivation_variety='zea_boomer' WHERE cultivation_variety='zea_mays_boomer'"
    # Reverse: Change item varieties#zea_aallexia with new name zea_mays_aallexia, new parent zea_mays and new itis_tsn 
    execute "UPDATE product_natures SET derivative_of='zea_aallexia' WHERE derivative_of='zea_mays_aallexia'"
    execute "UPDATE product_natures SET variety='zea_aallexia' WHERE variety='zea_mays_aallexia'"
    execute "UPDATE manure_management_plan_zones SET cultivation_variety='zea_aallexia' WHERE cultivation_variety='zea_mays_aallexia'"
    execute "UPDATE product_nature_variants SET derivative_of='zea_aallexia' WHERE derivative_of='zea_mays_aallexia'"
    execute "UPDATE product_nature_variants SET variety='zea_aallexia' WHERE variety='zea_mays_aallexia'"
    execute "UPDATE products SET derivative_of='zea_aallexia' WHERE derivative_of='zea_mays_aallexia'"
    execute "UPDATE products SET variety='zea_aallexia' WHERE variety='zea_mays_aallexia'"
    execute "UPDATE activities SET support_variety='zea_aallexia' WHERE support_variety='zea_mays_aallexia'"
    execute "UPDATE activities SET cultivation_variety='zea_aallexia' WHERE cultivation_variety='zea_mays_aallexia'"
  end
end
