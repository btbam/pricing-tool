(function () {
  'use strict';

  angular.module('user')
    .config(function ($stateProvider) {
      return $stateProvider.state('signOut', {
        url: '/signout',
        templateUrl: 'user/sign-out/sign-out.tpl.html',
        controller: 'SignOutCtrl as signOut'
      });
    });

})();
