(function () {
  'use strict';

  angular.module('user')
    .config(function ($stateProvider) {
      return $stateProvider.state('resetPasswordConfirm', {
        url: '/resetpasswordconfirm',
        templateUrl: 'user/reset-password-confirm/reset-password-confirm.tpl.html',
        controller: 'ResetPasswordConfirmCtrl as resetPasswordConfirm'
      });
    });

})();
