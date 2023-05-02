# frozen_string_literal: true

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
# == Table: master_production_prices
#
#  campaign                  :integer(4)
#  currency                  :string           not null
#  department_zone           :string           not null
#  final_price               :decimal(8, 2)    not null
#  label                     :string
#  nature                    :string
#  organic                   :boolean
#  price_duration            :interval         not null
#  price_unit                :string           not null
#  product_output_specie     :string           not null
#  production_reference_name :string
#  specie                    :string           not null
#  started_on                :date             not null
#  waiting_price             :decimal(8, 2)    not null
#
class MasterProductionPrice < LexiconRecord
  include Lexiconable

  scope :of_variety, ->(variety) { where(specie: variety.to_s) }
  scope :of_production_reference, ->(production_reference) { where(production_reference_name: production_reference.to_s) }
  scope :is_organic, -> { where(organic: true) }
  scope :of_organic, ->(organic) { where(organic: organic) }
  scope :of_harvest_year, ->(harvest_year) { where(campaign: harvest_year.to_i) }
  scope :of_output, ->(variety_output) { where(product_output_specie: variety_output.to_s) }
  scope :of_department, ->(department) { where(department_zone: department.to_i.to_s) }
  scope :of_departments, ->(*departments) { where(department_zone: departments) }
  scope :between, lambda { |started_on, stopped_on|
    where(started_on: started_on..stopped_on)
  }

end
