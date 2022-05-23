# == License
# Ekylibre - Simple agricultural ERP
# Copyright (C) 2008-2013 David Joulin, Brice Texier
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
# along with this program.  If not, see <http://www.gnu.org/licenses/>.
#

module Backend
  class WorkerContractsController < Backend::BaseController
    manage_restfully

    unroll

    def self.list_conditions
      code = search_conditions(worker_contracts: %i[name description], entities: %i[full_name]) + " ||= []\n"
      code.c
    end

    list(conditions: list_conditions) do |t|
      t.action :edit
      t.action :destroy, if: :destroyable?
      t.column :name, url: true
      t.column :entity, url: true
      t.column :started_at
      t.column :stopped_at, hidden: true
      t.column :description
    end

    # List of distribution for one worker_contract
    list(:distributions, model: :worker_contract_distributions, conditions: { worker_contract_id: 'params[:id]'.c }) do |t|
      t.column :affectation_percentage, percentage: true
      t.column :main_activity, url: true
    end

  end
end
