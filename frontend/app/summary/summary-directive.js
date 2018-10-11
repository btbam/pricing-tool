(function () {
  'use strict';

  angular.module('summary')
    .directive('summary', function () {
      return {
        restrict: 'AE',
        templateUrl: 'summary/summary-directive.tpl.html',
        replace: false,
        controllerAs: 'summary',
        controller: function ($filter, $rootScope, $scope, $state, SharedDataFactory, Summary) {
          var vm;
          vm = this;
          vm.name = 'summary';
          $scope.shared_data = SharedDataFactory;

          return $rootScope.$watch('myParams',  function (params) {
            if (!params) {
              return;
            }
            vm.dunsNumber = params.duns_number;
            vm.state = $state;
            if (!vm.dunsNumber) {
              return;
            }
            return Summary.getData(vm.dunsNumber)
              .then(function (response) {
                var suffix, values;
                vm.companyData = response.data;
                $rootScope.companyName = vm.companyData.company.name;
                values = [vm.companyData.company.employees.company, vm.companyData.company.employees.average];
                suffix = $filter('suffix')(Math.max.apply(Math, values));
                vm.formattedEmployeeData = [{
                  name: 'company',
                  value: vm.companyData.company.employees.company,
                  display_value: $filter('shortened')(vm.companyData.company.employees.company, '',
                    false,
                    suffix)
                }, {
                  name: 'average',
                  value: vm.companyData.company.employees.average,
                  display_value: $filter('shortened')(vm.companyData.company.employees.average, '',
                    false,
                    suffix)
                }];
                values = [vm.companyData.company.revenue.company, vm.companyData.company.revenue.average];
                suffix = $filter('suffix')(Math.max.apply(Math, values));
                vm.formattedRevenueData = [{
                  name: 'company',
                  value: vm.companyData.company.revenue.company,
                  display_value: $filter('shortened')(vm.companyData.company.revenue.company, '', false,
                    suffix)
                }, {
                  name: 'average',
                  value: vm.companyData.company.revenue.average,
                  display_value: $filter('shortened')(vm.companyData.company.revenue.average, '', false,
                    suffix)
                }];
                return vm;
              });
          });
        }
      };
    });
})();
