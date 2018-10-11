(function () {
  'use strict';

  angular.module('companyInfo')
    .directive('companyInfo', function ($http, $filter) {
      return {
        restrict: 'AE',
        templateUrl: 'company-info/company-info-directive.tpl.html',
        replace: false,
        controllerAs: 'companyInfo',
        scope: true,
        controller: function ($anchorScroll, $location, $scope, $stateParams,
          IndustrySicData, Summary, SharedDataFactory, User) {

          var vm;
          vm = this;
          vm.industry = {};
          vm.name = 'companyInfo';
          vm.s = $scope;
          vm.s.shared_data = SharedDataFactory;

          vm.getData = function () {
            return Summary.getData($stateParams.duns_number)
              .then(function (response) {
                vm.companyData = response.data.company;
                vm.companyData.zip_code = $filter('zipCode')(vm.companyData.zip_code);
                vm.industries = IndustrySicData.data;
                vm.industry.name = vm.companyData.industry;
                vm.s.shared_data.duns_number = $stateParams.duns_number;

                User.getHistoryForDuns($stateParams.duns_number)
                  .success(function (response) {
                    if (response.sic_code) {
                      vm.industry.name = vm.getIndustryNameForSic(response.sic_code);
                      vm.s.shared_data.industry_name = vm.industry.name;
                      vm.s.shared_data.menu_selects.industry =
                        vm.industry.name;
                      vm.s.shared_data.industry_sic = response.sic_code;
                    }
                  });

                vm.getIndustryData();
                vm.s.shared_data.years_in_operation = vm.companyData.start_year;

                if (vm.companyData.bankruptcy.description === 'High') {
                  vm.companyData.bankruptcy.visible = false;
                } else {
                  vm.companyData.bankruptcy.visible = false;
                }

                vm.companyData.ownership = false;

                if (typeof vm.companyData.is_public !== 'undefined' && vm.companyData.is_public !== null) {
                  if (vm.companyData.is_public === true) {
                    vm.companyData.ownership = 'Public';
                  } else if (vm.companyData.is_public === false) {
                    vm.companyData.ownership = 'Private';
                  }
                }
              });
          };

          vm.getIndustryData = function () {
            _.each(IndustrySicData.data, function (industry) {
              if (industry.name === vm.industry.name) {
                vm.s.shared_data.industry_sic = industry.sic_first;
                vm.s.shared_data.industry_name = industry.name;
              }
            });
          };

          vm.getIndustryNameForSic = function (sic_code) {
            var i, industry;
            for (i = 0; i < IndustrySicData.data.length; i++) {
              industry = IndustrySicData.data[i];
              if (parseInt(industry.sic_first) === parseInt(sic_code)) {
                return industry.name;
              }
            }
            return '';
          };

          vm.scrollTo = function (location) {
            $location.hash(location);
            $anchorScroll();
          };

          vm.updateIndustryData = function () {
            vm.s.shared_data.industry_name = vm.industry.name;
            vm.s.shared_data.menu_selects.industry =
              vm.industry.name;
            vm.s.shared_data.industry_sic = vm.industry.sic_first;
          };

          return vm;
        }
      };
    });
})();
