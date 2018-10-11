(function () {
  'use strict';

  angular.module('user', ['ui.router']);

  angular.module('user')
    .config(function ($stateProvider) {
      return $stateProvider.state('user', {
        url: '/user',
        templateUrl: 'user/user.tpl.html',
        controller: 'UserCtrl as user'
      });
    });

})();
