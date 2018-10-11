(function () {
  'use strict';

  angular.module('summary')
    .factory('Summary', function ($filter, $http, API_PATH) {
      return {
        getData: function (duns_number) {
          return $http.get(API_PATH + '/api/entity/' + duns_number)
            .success(function (response) {
              var suffix, values, vm;
              vm = {};
              vm.companyName = response.company.name;
              vm.companyUrl = response.company.url;
              vm.dataLoaded = true;
              vm.dunsNumber = response.company.duns_number;

              response.company.bankruptcy.display = false;
              response.company.bankruptcy.description = false;
              response.company.bankruptcy.description = (function () {
                if (response.company.bankruptcy.text === 'N/A') {
                  switch (response.company.bankruptcy.color) {
                    case 'green':
                      return 'Low';
                    case 'red':
                      return 'High';
                    case 'orange':
                      return 'Medium';
                  }
                } else {
                  return response.company.bankruptcy.text;
                }
              })();
              response.company.bankruptcy.display = response.company.bankruptcy.color !== 'gray';
              vm.graphData = {
                financial_stress: response.company.financial_stress,
                revenue: response.company.revenue,
                employees: response.company.employees
              };
              if (!vm.graphData.financial_stress.company) {
                vm.graphData.financial_stress.company = 0;
              }
              if (!vm.graphData.financial_stress.average) {
                vm.graphData.financial_stress.average = 0;
              }
              if (!vm.graphData.revenue.company) {
                vm.graphData.revenue.company = 0;
              }
              if (!vm.graphData.revenue.average) {
                vm.graphData.revenue.average = 0;
              }
              values = [vm.graphData.revenue.company, vm.graphData.revenue.average];
              suffix = $filter('suffix')(Math.max.apply(Math, values));
              vm.graphData.revenue.amount = '($' + suffix + ')';
              if (!vm.graphData.employees.company) {
                vm.graphData.employees.company = 0;
              }
              if (!vm.graphData.employees.average) {
                vm.graphData.employees.average = 0;
              }
              values = [vm.graphData.employees.company, vm.graphData.employees.average];
              suffix = $filter('suffix')(Math.max.apply(Math, values));
              if (suffix) {
                vm.graphData.employees.amount = '(' + suffix + ')';
              }
              if (response.company.url) {
                vm.companyUrlFormatted = response.company.url.replace('http://', '');
                vm.companyUrlFormatted = vm.companyUrlFormatted.replace('https://', '');
              }
              vm.companyAddress = response.company.address;
              vm.companyHQState = response.company.hq_state;
              vm.industryCode = response.company.industry;
              if (!response.company.start_year) {
                vm.startYear = 'N/A';
              } else {
                vm.startYear = response.company.start_year;
              }
              vm.companyDescription = response.company.description;
              return vm;
            })
            .error(function (response, status) {
              console.log('error response', response);
              console.log('error status', status);
            });
        }
      };
    });
})();
