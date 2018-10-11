(function () {
  'use strict';

  angular.module('portfolio')
    .controller(
    'PortfolioCtrl', [
      '$auth', '$location', '$rootScope', '$scope', 'portfolioFactory',
      function ($auth, $location, $rootScope, $scope, portfolioFactory) {
        $scope.ctrlName = 'PortfolioCtrl';
        $scope.companyData = portfolioFactory;
        $scope.is_industry = 'Industry';

        /*unused for now?*/
        $scope.chartSelectionChange = function () {
        };

        if (!$auth.isAuthenticated()) {
          $location.url('signin');
        }

        $rootScope.$broadcast('stopLoader');

        return $scope;
      }
    ]
  );

})();
