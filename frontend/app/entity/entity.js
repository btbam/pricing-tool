(function () {
  'use strict';

  angular.module('entity', ['ui.router']);

  angular.module('entity')
    .config(function ($stateProvider) {
      return $stateProvider.state('entity', {
        url: '/entity/:duns_number',
        templateUrl: 'entity/entity.tpl.html',
        controller: 'EntityCtrl',
        controllerAs: 'entity',
        resolve: {
          basicCompanyData: function (Summary, $state, $stateParams, $rootScope) {
            $rootScope.$broadcast('startLoader');
            return Summary.getData($stateParams.duns_number)
              .then(function (response) {
                $rootScope.companyName = response.data.company.name;
              }, function (error) {
                console.log(error);
                $state.go('search');
              });
          }
        }
      });
    });

})();
