(function () {
  'use strict';

  angular.module('user')
    .config(function ($stateProvider) {
      return $stateProvider.state('signIn', {
        url: '/signin',
        templateUrl: 'user/sign-in/sign-in.tpl.html',
        controller: 'SignInCtrl as signIn'
      });
    });

})();
