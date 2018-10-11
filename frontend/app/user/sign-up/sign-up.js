(function () {
  'use strict';

  angular.module('user')
    .config(function ($stateProvider) {
      return $stateProvider.state('signUp', {
        url: '/signup',
        templateUrl: 'user/sign-up/sign-up.tpl.html',
        controller: 'SignUpCtrl as signUp'
      });
    });
})();
