(function () {
  'use strict';

  angular.module('user')
    .config(function ($stateProvider) {
      return $stateProvider.state('resetPassword', {
        url: '/resetpassword?reset_password_token',
        templateUrl: 'user/reset-password/reset-password.tpl.html',
        controller: 'ResetPasswordCtrl as resetPassword'
      });
    });

})();
