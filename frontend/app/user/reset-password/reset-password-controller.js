(function () {
  'use strict';

  angular.module('user')
    .controller('ResetPasswordCtrl', function ($rootScope) {
      var vm;
      vm = this;
      vm.ctrlName = 'ResetPasswordCtrl';

      $rootScope.$broadcast('stopLoader');

      return vm;
    });

})();
