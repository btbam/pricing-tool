(function () {
  'use strict';
  angular.module('shared')
    .factory('SharedDataFactory', function () {
      return {
        benchmark_data: {},
        current_group: '',
        dno_rate_need: '',
        duns_number: '',
        employee_menu_select: '',
        epli_rate_need: '',
        epli_renewal: '',
        industry_name: '',
        industry_sic: '',
        loss_tab: 'do',
        menu_selects: {},
        rate_need_data: {},
        years_in_operation: ''
      };
    });
})();
