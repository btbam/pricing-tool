(function () {
  'use strict';
  angular.module('companyOverview')
    .directive('companyOverview', function () {
      return {
        restrict: 'AE',
        templateUrl: 'company-overview/company-overview-directive.tpl.html',
        controllerAs: 'companyOverview'
      };
    });
})();
