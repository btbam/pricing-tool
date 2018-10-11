(function () {
  'use strict';

  angular.module('graphs', ['ui.router']);

  angular.module('graphs')
    .config(function ($stateProvider) {
      return $stateProvider.state('graphs', {
        url: '/graphs',
        templateUrl: 'graphs/graphs.tpl.html',
        controller: 'GraphsCtrl as graphs'
      });
    });
})();
