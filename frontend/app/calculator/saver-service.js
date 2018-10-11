(function () {
  'use strict';

  /**
    * @ngdoc service
    * @name calculator.service:Saver

    * @description
   */
  var Saver;

  Saver = (function () {
    function Saver() {
      this.name = 'Saver';
    }

    Saver.prototype.prepareData = function (sic, vm) {
      var save_data = {
        sic_code: sic,
        assets: vm.data.assets,
        years_in_operation: vm.data.years_in_operation
      };
      save_data.do = {
        limit: vm.data.dno_factors.limit,
        retention: vm.data.dno_factors.retention,
        claims_history: vm.data.dno_factors.claims_history_factor,
        financial_conditions: vm.data.dno_factors.financial_conditions,
        mergers_and_acquisitions: vm.data.dno_factors.mergers_and_acquisitions,
        management_experience_qualifications: vm.data.dno_factors.management_experience_qualifications,
        entity_nonentity_coverage: vm.data.dno_factors.entity_nonentity_coverage,
        revenue_asset_irregularities: vm.data.dno_factors.revenue_asset_irregularities,
        specialty_coverage: vm.data.dno_factors.specialty_coverage_factor,
        private_company: vm.data.dno_factors.private_company_factor,
        industry: vm.data.dno_factors.industry,
        litigation: vm.data.dno_factors.litigation_factor,
        years_in_operation: vm.data.dno_factors.years_in_operation_selected,
        has_changed: vm.changed_dno_data
      };
      save_data.epli = {
        limit: vm.data.epli_factors.limit,
        retention: vm.data.epli_factors.retention,
        human_resources_and_loss_prevention: vm.data.epli_factors.human_resources_and_loss_prevention,
        workforce_mgmt: vm.data.epli_factors.workforce_mgmt,
        incident_mgmt: vm.data.epli_factors.incident_mgmt,
        financial_conditions: vm.data.epli_factors.financial_conditions,
        claims_reporting_procedures: vm.data.epli_factors.claims_reporting_procedures,
        claims_history: vm.data.epli_factors.claims_history,
        industry_third_party: vm.data.epli_factors.industry_third_party,
        total_non_union_full_time: vm.input_by_user_employees.full.non_union,
        total_non_union_part_time: vm.input_by_user_employees.part.non_union,
        total_union_full_time: vm.input_by_user_employees.full.union,
        total_union_part_time: vm.input_by_user_employees.part.union,
        total_foreign_full_time: vm.input_by_user_employees.full.foreign,
        total_foreign_part_time: vm.input_by_user_employees.part.foreign,
        california_non_union_full_time: vm.ca_employees.full.non_union,
        california_non_union_part_time: vm.ca_employees.part.non_union,
        california_union_full_time: vm.ca_employees.full.union,
        california_union_part_time: vm.ca_employees.part.union,
        dc_mi_fl_tx_non_union_full_time: vm.dcflmitx_employees.full.non_union,
        dc_mi_fl_tx_non_union_part_time: vm.dcflmitx_employees.part.non_union,
        dc_mi_fl_tx_union_full_time: vm.dcflmitx_employees.full.union,
        dc_mi_fl_tx_union_part_time: vm.dcflmitx_employees.part.union,
        prior_acts_coverage: vm.data.epli_factors.prior_acts_coverage_static,
        punitive_damage: vm.data.epli_factors.punitive_damage_static,
        years_in_operation: vm.data.epli_factors.years_in_operation_selected,
        has_changed: vm.changed_epli_data
      };
      return save_data;
    };

    return Saver;

  })();

  angular.module('calculator')
    .service('Saver', Saver);
})();
