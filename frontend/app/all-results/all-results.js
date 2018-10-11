(function () {
  'use strict';

  angular.module('all-results', ['ui.router']);

  angular.module('all-results')
    .config(function ($stateProvider) {
      return $stateProvider.state('all-results', {
        url: '/all-results/:search_term',
        templateUrl: 'all-results/all-results.tpl.html',
        controller: 'AllResultsCtrl',
        controllerAs: 'allResults'
      });
    });
})();
