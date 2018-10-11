(function () {
  'use strict';

  angular.module('user')
    .controller('ResetPasswordConfirmCtrl', function ($rootScope) {
      var vm;
      vm = this;
      vm.ctrlName = 'ResetPasswordConfirmCtrl';
      $rootScope.$broadcast('stopLoader');
      return vm;
    });

})();
