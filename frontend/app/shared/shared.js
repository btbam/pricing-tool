(function () {
  'use strict';

  angular.module('shared', [
    'ui.router',
    'toastr'
  ]);

  angular.module('shared')
    .config(function ($stateProvider) {
      return $stateProvider.state('shared', {
        url: '/shared',
        templateUrl: 'shared/shared.tpl.html',
        controller: 'SharedCtrl as shared'
      });
    });
})();
