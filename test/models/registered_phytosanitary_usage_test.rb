# = Informations
#
# == License
#
# Ekylibre - Simple agricultural ERP
# Copyright (C) 2008-2009 Brice Texier, Thibaud Merigon
# Copyright (C) 2010-2012 Brice Texier
# Copyright (C) 2012-2014 Brice Texier, David Joulin
# Copyright (C) 2015-2023 Ekylibre SAS
#
# This program is free software: you can redistribute it and/or modify
# it under the terms of the GNU Affero General Public License as published by
# the Free Software Foundation, either version 3 of the License, or
# any later version.
#
# This program is distributed in the hope that it will be useful,
# but WITHOUT ANY WARRANTY; without even the implied warranty of
# MERCHANTABILITY or FITNESS FOR A PARTICULAR PURPOSE.  See the
# GNU Affero General Public License for more details.
#
# You should have received a copy of the GNU Affero General Public License
# along with this program.  If not, see http://www.gnu.org/licenses.
#
# == Table: registered_phytosanitary_usages
#
#  applications_count                :integer(4)
#  applications_frequency            :interval
#  crop                              :jsonb
#  crop_label_fra                    :string
#  decision_date                     :date
#  description                       :jsonb
#  development_stage_max             :integer(4)
#  development_stage_min             :integer(4)
#  dose_quantity                     :decimal(19, 4)
#  dose_unit                         :string
#  dose_unit_factor                  :float
#  dose_unit_name                    :string
#  ephy_usage_phrase                 :string           not null
#  extract_spray_volume_max_quantity :string
#  extract_spray_volume_max_unit     :string
#  id                                :string           not null, primary key
#  lib_court                         :integer(4)
#  pre_harvest_delay                 :interval
#  pre_harvest_delay_bbch            :integer(4)
#  product_id                        :integer(4)       not null
#  record_checksum                   :integer(4)
#  species                           Array<:text>
#  spray_volume_max_dose_quantity    :decimal(19, 4)
#  spray_volume_max_dose_unit        :string
#  spray_volume_max_dose_unit_name   :string
#  spray_volume_max_quantity         :decimal(19, 4)
#  spray_volume_max_unit             :string
#  spray_volume_max_unit_name        :string
#  state                             :string           not null
#  target_name                       :jsonb
#  target_name_label_fra             :string
#  treatment                         :jsonb
#  untreated_buffer_aquatic          :integer(4)
#  untreated_buffer_arthropod        :integer(4)
#  untreated_buffer_plants           :integer(4)
#  usage_conditions                  :string
#
require 'test_helper'

class RegisteredPhytosanitaryUsageTest < Ekylibre::Testing::ApplicationTestCase::WithFixtures
  setup do
    @trees_and_shrubs_usage = RegisteredPhytosanitaryUsage.find_by(species: '{ephy_trees_and_shrubs}')
    @tropical_crops_usage = RegisteredPhytosanitaryUsage.find_by(species: '{ephy_tropical_crops}')
    @citrus_usage = RegisteredPhytosanitaryUsage.find_by(species: '{ephy_citrus}')
  end

  test 'of_variety scope returns usages matching at least one of the provided varieties' do
    assert_includes RegisteredPhytosanitaryUsage.of_variety(:citrus), @trees_and_shrubs_usage
    assert_includes RegisteredPhytosanitaryUsage.of_variety(:citrus), @citrus_usage
    refute_includes RegisteredPhytosanitaryUsage.of_variety(:citrus), @tropical_crops_usage

    assert_includes RegisteredPhytosanitaryUsage.of_variety(:carica), @trees_and_shrubs_usage
    assert_includes RegisteredPhytosanitaryUsage.of_variety(:carica), @tropical_crops_usage
    refute_includes RegisteredPhytosanitaryUsage.of_variety(:carica), @citrus_usage

    assert_includes RegisteredPhytosanitaryUsage.of_variety(:citrus, :carica), @trees_and_shrubs_usage
    assert_includes RegisteredPhytosanitaryUsage.of_variety(:citrus, :carica), @citrus_usage
    assert_includes RegisteredPhytosanitaryUsage.of_variety(:citrus, :carica), @tropical_crops_usage
  end

  test 'of_varieties scope returns usages matching every single provided varieties' do
    assert_includes RegisteredPhytosanitaryUsage.of_varieties(:citrus, :carica), @trees_and_shrubs_usage
    refute_includes RegisteredPhytosanitaryUsage.of_varieties(:citrus, :carica), @citrus_usage
    refute_includes RegisteredPhytosanitaryUsage.of_varieties(:citrus, :carica), @tropical_crops_usage
  end
end
