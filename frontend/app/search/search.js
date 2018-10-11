(function () {
  'use strict';

  angular.module('search', ['ui.router']);

  angular.module('search')
    .config(function ($stateProvider) {
      return $stateProvider.state('search', {
        url: '/search',
        templateUrl: 'search/search.tpl.html',
        controller: 'SearchCtrl',
        controllerAs: 'search'
      });
    });

})();
