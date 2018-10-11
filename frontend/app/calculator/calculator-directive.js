(function () {
  'use strict';

  angular.module('calculator')
    .directive('calculator', function () {
      return {
        restrict: 'AE',
        scope: {},
        templateUrl: 'calculator/calculator-directive.tpl.html',
        replace: false,
        controllerAs: 'calculator',
        controller: function ($rootScope, $scope, $http, $stateParams, $timeout, Calculator,
          BasePremium, DeltaPercent, Factors, FinalPremium, LimitOfLiabilityEpliRetention,
          LimitOfLiabilityRetention, Saver, SharedDataFactory) {

          var CHECK_FACTOR_ERRORS_TIMEOUT = 1000,
            SAVE_TIMEOUT = 3000,
            UPDATE_TIMEOUT = 1000,
            vm;

          vm = this;
          vm.changed_dno_data = false;
          vm.changed_epli_data = false;
          vm.name = 'calculator';
          vm.rs = $rootScope;
          vm.s = $scope;
          vm.s.shared_data = SharedDataFactory;
          vm.calculation_count = 0;

          vm.calculateBallpark = function (data) {
            data.ballpark_premium = 0;
            data.ballpark_benchmark_premium = 0;
            if (!vm.collapseDno) {
              data.ballpark_premium += data.dno_factors.final_premium;
              data.ballpark_benchmark_premium += data.dno_factors.benchmark_premium;
            }
            if (!vm.collapseEpli) {
              data.ballpark_premium += data.epli_factors.final_premium;
              data.ballpark_benchmark_premium += data.epli_factors.benchmark_premium;
            }
            data.ballparkPercent = DeltaPercent.get(data.ballpark_benchmark_premium, data.ballpark_premium);

            return data;
          };

          vm.calculateBenchmarkPremiumDno = function (data) {
            data.dno_factors.benchmark_premium =
              (data.dno_factors.limitOfLiabilityRetention *
               data.dno_factors.base_premium *
               data.dno_factors.financial_conditions_static *
               data.dno_factors.industry_static *
               data.dno_factors.specialty_coverage.prior_acts_static *
               data.dno_factors.specialty_coverage.punitive_damages_static *
               data.dno_factors.years_in_operation_selected_static);

            return data;
          };

          vm.calculateBenchmarkPremiumEPLI = function (data) {
            data.epli_factors.benchmark_premium =
              (data.epli_factors.limitOfLiabilityRetention *
               data.epli_factors.blended_base_premium *
               data.epli_factors.claims_history_static *
               data.epli_factors.claims_reporting_procedures_static *
               data.epli_factors.financial_conditions_static *
               data.epli_factors.human_resources_and_loss_prevention_static *
               data.epli_factors.incident_mgmt_static *
               data.epli_factors.industry_third_party_static *
               data.epli_factors.prior_acts_coverage_static *
               data.epli_factors.punitive_damage_static *
               data.epli_factors.workforce_mgmt_static *
               data.epli_factors.years_in_operation_selected_static);

            return data;
          };

          vm.calculateBlendedBaseRateEpli = function (data) {
            data.epli_factors.blended_base_rate =
              Factors.blendedBaseRate(
                data.epli_factors.ca_ratable_employees,
                data.epli_factors.dcflmitx_ratable_employees,
                data.epli_factors.other_ratable_employees
              );

            return data;
          };

          vm.calculateCompanyRateNeed = function (data) {
            var company_rate_need;

            if (data.ballpark_benchmark_premium === 0) {
              company_rate_need = 0;
            } else {
              company_rate_need = Math.max(0, 1 - (data.ballpark_premium / data.ballpark_benchmark_premium));
            }

            return company_rate_need;
          };

          vm.calculateData = function (data) {
            var company_rate_need, total_employees;
            if (data === null || data === undefined) {
              data = vm.data;
            }

            data = vm.calculateDNO(data);
            data = vm.calculateEPLI(data);
            data = vm.calculateBallpark(data);
            company_rate_need = vm.calculateCompanyRateNeed(data);
            vm.s.shared_data.benchmark_data.ballpark = data.ballpark_premium;
            vm.s.shared_data.benchmark_data.benchmark = data.ballpark_benchmark_premium;
            vm.s.shared_data.benchmark_data.ballparkPercentChange = data.ballparkPercent.percent_change;
            vm.s.shared_data.benchmark_data.ballparkPercentChangeDirection =
              data.ballparkPercent.percent_change_direction;
            vm.s.shared_data.rate_need_data.company = company_rate_need * 100;
            data.companyName = vm.rs.companyName;
            total_employees = vm.calculateTotalEmployees(data);
            vm.s.shared_data.employee_menu_select =
              Factors.getEmployeeTotalMenuSelect(total_employees);
            vm.s.shared_data.menu_selects.number_of_employees =
              vm.s.shared_data.employee_menu_select;

            vm.data = data;
            if (++vm.calculation_count > 1) {
              vm.checkSave();
            }
          };

          vm.calculateDataWithTimeout = function (markAsChanged) {
            $timeout.cancel(vm.timer);
            vm.timer = $timeout(function () {
              vm.calculateData();
              if (markAsChanged === 'EPLI') {
                vm.changed_epli_data = true;
              }
              if (markAsChanged === 'DNO') {
                vm.changed_dno_data = true;
              }
            }, UPDATE_TIMEOUT);
          };

          vm.calculateDNO = function (data) {
            var dnoPercentChange;

            data.dno_factors.litigation_factor = data.dno_factors.litigation_factor ||
              Factors.litigationFactor(data.dno_factors.litigation.litigation,
                  data.dno_factors.litigation.litigation_ex_dno);
            data.dno_factors.claims_history_factor = data.dno_factors.claims_history_factor || Factors.claimsHistory(
              data.dno_factors.claims_history.frequency, data.dno_factors.claims_history.severity);
            data = vm.calculateSpecialityCoverageDno(data);
            data = vm.calculatePrivateCompanyDno(data);
            data.dno_factors.retention = LimitOfLiabilityRetention.findClosestSIR(data.dno_factors.retention) * 1000;
            data.dno_factors.limit = LimitOfLiabilityRetention.findClosestLimit(data.dno_factors.limit) * 1000;
            data.dno_factors.limitOfLiabilityRetention =
              LimitOfLiabilityRetention.get(data.dno_factors.limit, data.dno_factors.retention);
            data.dno_factors.years_in_operation = Factors.yearsInOperation(data.years_in_operation);
            data = vm.calculateYearsInOperation(data, 'dno');
            data.dno_factors.base_premium = BasePremium.getDO(data.financial_institution, data.assets);
            data = vm.calculateBenchmarkPremiumDno(data);
            data.dno_factors.final_premium = FinalPremium.getDO(data.dno_factors);
            data.dno_factors.off_manual = Factors.offManual(data.dno_factors.benchmark_premium,
              data.dno_factors.final_premium);
            dnoPercentChange = DeltaPercent.get(data.dno_factors.benchmark_premium, data.dno_factors.final_premium);
            data.dno_factors.percent_change_direction = dnoPercentChange.percent_change_direction;
            data.dno_factors.percent_change = dnoPercentChange.percent_change;

            return data;
          };

          vm.calculateEmployeesEPLI = function (data) {
            data.epli_factors.ca_ratable_employees = Factors.ratableEmployees(vm.ca_employees, 'CA');
            data.epli_factors.dcflmitx_ratable_employees = Factors.ratableEmployees(vm.dcflmitx_employees, 'DCFLMITX');
            data.epli_factors.other_ratable_employees = Factors.ratableEmployees(vm.other_employees, 'Other');

            data.epli_factors.total_ratable_employees =
              data.epli_factors.ca_ratable_employees + data.epli_factors.dcflmitx_ratable_employees +
              data.epli_factors.other_ratable_employees;
            return data;
          };

          vm.calculateEPLI = function (data) {
            var epliPercentChange;

            data.epli_factors.renewal = vm.s.shared_data.epli_renewal;
            data.epli_factors = data.epli_factors || {};
            data.epli_factors.retention =
              LimitOfLiabilityEpliRetention.findClosestSIR(data.epli_factors.retention) * 1000;
            data.epli_factors.limit = LimitOfLiabilityEpliRetention.findClosestLimit(data.epli_factors.limit) * 1000;
            data.epli_factors.limitOfLiabilityRetention =
              LimitOfLiabilityEpliRetention.get(data.epli_factors.limit, data.epli_factors.retention);
            data.epli_factors.years_in_operation = Factors.yearsInOperationEpli(data.years_in_operation);
            data = vm.calculateYearsInOperation(data, 'epli');
            data = vm.calculateEmployeesEPLI(data);
            data.epli_factors.base_premium = BasePremium.getEPLI(data.epli_factors.total_ratable_employees);
            data = vm.calculateBlendedBaseRateEpli(data);
            data.epli_factors.blended_base_premium =
              data.epli_factors.blended_base_rate * data.epli_factors.base_premium;
            data = vm.calculateBenchmarkPremiumEPLI(data);
            data.epli_factors.final_premium = FinalPremium.getEPLI(data.epli_factors);
            data.epli_factors.off_manual = Factors.offManual(data.epli_factors.benchmark_premium,
              data.epli_factors.final_premium);
            epliPercentChange = DeltaPercent.get(data.epli_factors.benchmark_premium, data.epli_factors.final_premium);
            data.epli_factors.percent_change_direction = epliPercentChange.percent_change_direction;
            data.epli_factors.percent_change = epliPercentChange.percent_change;

            return data;
          };

          vm.calculatePrivateCompanyDno = function (data) {
            data.dno_factors.private_company_factor =
              data.dno_factors.private_company_factor ||
              Factors.privateCompanyModifier(
                data.dno_factors.private_company.dno_percent_private_stock,
                data.dno_factors.private_company.esop_ownership,
                data.dno_factors.private_company.ipo,
                data.dno_factors.private_company.public_debt,
                data.dno_factors.private_company.private_placement,
                data.dno_factors.private_company.nonentity_epli,
                data.dno_factors.private_company.board_auditor
              );

            return data;
          };

          vm.calculateSpecialityCoverageDno = function (data) {
            data.dno_factors.specialty_coverage_factor =
              data.dno_factors.specialty_coverage_factor ||
              Factors.specialtyCoverage(data.dno_factors.specialty_coverage.punitive_damages,
                data.dno_factors.specialty_coverage.prior_acts
              );

            return data;
          };

          vm.calculateTotalEmployees = function (data) {
            var total;
            total =
              (data.epli_factors.other_ratable_employees +
               data.epli_factors.ca_ratable_employees +
               data.epli_factors.dcflmitx_ratable_employees);

            return total;
          };

          vm.calculateYearsInOperation = function (data, flag) {
            var currentData;
            if (flag === 'dno') {
              currentData = data.dno_factors;
            } else {
              currentData = data.epli_factors;
            }

            if (!currentData.years_in_operation_selected ||
                currentData.years_in_operation_selected < currentData.years_in_operation.min ||
                currentData.years_in_operation_selected > currentData.years_in_operation.max) {

              if (data.user_history) {
                currentData.years_in_operation_selected = (flag === 'dno') ?
                  data.user_history.dno_factors.years_in_operation :
                  data.user_history.epli_factors.years_in_operation;
              } else {
                currentData.years_in_operation_selected = currentData.years_in_operation.midpoint;
              }
              currentData.years_in_operation_selected_static = currentData.years_in_operation.midpoint;
            }

            return data;
          };

          vm.checkFactorErrors = function (factor, min, neutral, max) {
            $timeout.cancel(vm.factorsTimer);
            vm.factorsTimer = $timeout(function () {
              vm.data.dno_factors[factor] = Factors.checkFactorErrors(vm.data.dno_factors[factor], min, neutral,
                max);
              vm.calculateData();
            }, CHECK_FACTOR_ERRORS_TIMEOUT);
          };

          vm.checkFactorErrorsEpli = function (factor, renewal, renewalData, newData) {
            $timeout.cancel(vm.factorsTimer);
            vm.factorsTimer = $timeout(function () {
              if (renewal) {
                vm.data.epli_factors[factor] = Factors.checkFactorErrorsEpli(vm.data.epli_factors[factor], renewalData);
              } else {
                vm.data.epli_factors[factor] = Factors.checkFactorErrorsEpli(vm.data.epli_factors[factor], newData);
              }
              vm.calculateData();
            }, CHECK_FACTOR_ERRORS_TIMEOUT);
          };

          vm.checkSave = function () {
            $timeout.cancel(vm.saveTimer);
            vm.saveTimer = $timeout(function () {
              var save_data = Saver.prepareData(vm.s.shared_data.industry_sic, vm);
              return Calculator.saveData($stateParams.duns_number, save_data);
            }, SAVE_TIMEOUT);
          };

          vm.getData = function () {
            return Calculator.getData($stateParams.duns_number, vm.s.shared_data.industry_sic)
              .success(function (response) {
                var data = vm.initializeVars(response);
                if (response.user_history) {
                  vm.changed_epli_data = response.user_history.epli_factors.has_changed ? true : false;
                  vm.changed_dno_data = response.user_history.dno_factors.has_changed ? true : false;
                }
                return vm.calculateData(data);
              });
          };

          vm.getDnoData = function () {
            return Calculator.getData($stateParams.duns_number, vm.s.shared_data.industry_sic, 'true')
              .success(function (response) {
                var data = vm.initializeDnoVars(response);
                vm.data.dno_factors = data.dno_factors;
                vm.changed_dno_data = false;
                return vm.calculateData(vm.data);
              });
          };

          vm.getEPLIData = function () {
            return Calculator.getData($stateParams.duns_number, vm.s.shared_data.industry_sic, 'true')
              .success(function (response) {
                var data = vm.initializeEpliVars(response);
                vm.data.epli_factors = data.epli_factors;
                vm.changed_epli_data = false;
                return vm.calculateData(vm.data);
              });
          };

          vm.initializeDnoVars = function (data) {
            if (vm.s.shared_data.years_in_operation === undefined) {
              data.years_in_operation = 0;
            } else {
              data.years_in_operation = vm.s.shared_data.years_in_operation;
            }

            // DO Static Factors
            data.dno_factors.financial_conditions_static = data.dno_factors.financial_conditions;
            data.dno_factors.industry_static = data.dno_factors.industry;
            data.dno_factors.specialty_coverage.prior_acts_static =
              data.dno_factors.specialty_coverage.prior_acts;
            data.dno_factors.specialty_coverage.punitive_damages_static =
              data.dno_factors.specialty_coverage.punitive_damages;

            if (data.user_history) {
              var dno = data.user_history.dno_factors;
              data.dno_factors.limit = dno.limit;
              data.dno_factors.retention = dno.retention;
              data.dno_factors.claims_history_factor = dno.claims_history;
              data.dno_factors.financial_conditions = dno.financial_conditions;
              data.dno_factors.industry = dno.industry;
              data.dno_factors.years_in_operation = dno.years_in_operation;
              data.dno_factors.mergers_and_acquisitions = dno.mergers_and_acquisitions;
              data.dno_factors.entity_nonentity_coverage = dno.entity_nonentity_coverage;
              data.dno_factors.management_experience_qualifications = dno.management_experience_qualifications;
              data.dno_factors.revenue_asset_irregularities = dno.revenue_asset_irregularities;
              data.dno_factors.private_company_factor = dno.private_company;
              data.dno_factors.specialty_coverage_factor = dno.specialty_coverage;
            }

            return data;
          };

          vm.initializeEmployees = function () {
            vm.ca_employees = {full: {union: 0, non_union: 0}, part: {union: 0, non_union: 0}};
            vm.dcflmitx_employees = {full: {union: 0, non_union: 0}, part: {union: 0, non_union: 0}};
            vm.input_by_user_employees = {
              full: {union: 0, non_union: 0, foreign: 0},
              part: {union: 0, non_union: 0, foreign: 0}
            };
            vm.other_employees = {
              full: {union: 0, non_union: 0, foreign: 0},
              part: {union: 0, non_union: 0, foreign: 0}
            };
            vm.previous_ca_employees = {
              full: {union: 0, non_union: 0, foreign: 0},
              part: {union: 0, non_union: 0, foreign: 0}
            };
            vm.previous_dcflmitx_employees = {
              full: {union: 0, non_union: 0, foreign: 0},
              part: {union: 0, non_union: 0, foreign: 0}
            };
            vm.previous_total_employees = {
              full: {union: 0, non_union: 0, foreign: 0},
              part: {union: 0, non_union: 0, foreign: 0}
            };
          };

          vm.initializeEpliVars = function (data) {
            data.epli_factors.limit = 0;
            data.epli_factors.retention = 0;

            data.epli_factors.financial_conditions_static = data.epli_factors.financial_conditions;
            data.epli_factors.industry_third_party_static = data.epli_factors.industry_third_party;
            data.epli_factors.prior_acts_coverage_static = data.epli_factors.prior_acts_coverage;
            data.epli_factors.punitive_damage_static = data.epli_factors.punitive_damage;
            data.epli_factors.claims_history_static = data.epli_factors.claims_history;
            data.epli_factors.claims_reporting_procedures_static = data.epli_factors.claims_reporting_procedures;
            data.epli_factors.human_resources_and_loss_prevention_static =
              data.epli_factors.human_resources_and_loss_prevention;
            data.epli_factors.incident_mgmt_static = data.epli_factors.incident_mgmt;
            data.epli_factors.workforce_mgmt_static = data.epli_factors.workforce_mgmt;

            if (data.user_history) {
              var epli = data.user_history.epli_factors;
              data.epli_factors.limit = epli.limit;
              data.epli_factors.retention = epli.retention;
              data.epli_factors.human_resources_and_loss_prevention = epli.human_resources_and_loss_prevention;
              data.epli_factors.workforce_mgmt = epli.workforce_mgmt;
              data.epli_factors.incident_mgmt = epli.incident_mgmt;
              data.epli_factors.financial_conditions = epli.financial_conditions;
              data.epli_factors.claims_reporting_procedures = epli.claims_reporting_procedures;
              data.epli_factors.industry_third_party = epli.industry_third_party;
              data.epli_factors.claims_history = epli.claims_history;

              vm.input_by_user_employees.full.non_union = epli.total_non_union_full_time;
              vm.input_by_user_employees.full.union = epli.total_union_full_time;
              vm.input_by_user_employees.full.foreign = epli.total_foreign_full_time;
              vm.input_by_user_employees.part.non_union = epli.total_non_union_part_time;
              vm.input_by_user_employees.part.union = epli.total_union_part_time;
              vm.input_by_user_employees.part.foreign = epli.total_foreign_part_time;
              vm.ca_employees.full.non_union = epli.california_non_union_full_time;
              vm.ca_employees.full.union = epli.california_union_full_time;
              vm.ca_employees.part.non_union = epli.california_non_union_part_time;
              vm.ca_employees.part.union = epli.california_union_part_time;
              vm.dcflmitx_employees.full.non_union = epli.dc_mi_fl_tx_non_union_full_time;
              vm.dcflmitx_employees.full.union = epli.dc_mi_fl_tx_union_full_time;
              vm.dcflmitx_employees.part.non_union = epli.dc_mi_fl_tx_non_union_part_time;
              vm.dcflmitx_employees.part.union = epli.dc_mi_fl_tx_union_part_time;

              vm.sumInputValues('full', 'non_union');
              vm.sumInputValues('full', 'union');
              vm.sumInputValues('part', 'non_union');
              vm.sumInputValues('part', 'union');
            }
            return data;
          };

          vm.initializeVars = function (data) {
            data = vm.initializeDnoVars(data);
            data = vm.initializeEpliVars(data);
            if (data.user_history) {
              data.assets = parseInt(data.user_history.assets);
              data.years_in_operation = data.user_history.years_in_operation;
            }
            return data;
          };

          vm.setDNOasChanged = function () {
            vm.changed_dno_data = true;
          };

          vm.setEPLIasChanged = function () {
            vm.changed_epli_data = true;
          };

          vm.sumInputValues = function (isFullTime, isUnion) {
            var  caValue, dcValue, otherValue, totalValue;
            caValue = parseInt(vm.ca_employees[isFullTime][isUnion]);
            dcValue = parseInt(vm.dcflmitx_employees[isFullTime][isUnion]);
            otherValue = parseInt(vm.other_employees[isFullTime][isUnion]);
            totalValue = parseInt(vm.input_by_user_employees[isFullTime][isUnion]);

            if (totalValue >= (caValue + dcValue)) {
              vm.other_employees[isFullTime][isUnion] = totalValue - caValue - dcValue;
              vm.previous_ca_employees[isFullTime][isUnion] = vm.ca_employees[isFullTime][isUnion];
              vm.previous_dcflmitx_employees[isFullTime][isUnion] = vm.dcflmitx_employees[isFullTime][isUnion];
            } else {
              vm.ca_employees[isFullTime][isUnion] =  vm.previous_ca_employees[isFullTime][isUnion];
              vm.dcflmitx_employees[isFullTime][isUnion] =  vm.previous_dcflmitx_employees[isFullTime][isUnion];
            }

            vm.calculateDataWithTimeout();
          };

          vm.toggleDno = function () {
            vm.collapseDno = !vm.collapseDno;
            vm.calculateDataWithTimeout();
          };

          vm.toggleEpli = function () {
            vm.collapseEpli = !vm.collapseEpli;
            vm.calculateDataWithTimeout();
          };

          vm.initializeEmployees();

          vm.s.$watch('shared_data.industry_sic', function () {
            if (vm.s.shared_data.industry_sic) {
              vm.getData();
            }
          });

          return vm;
        }
      };
    });
})();
