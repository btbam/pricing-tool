(function () {
  'use strict';

  angular.module('user')
    .controller('SignUpCtrl', function ($rootScope) {
      var vm;
      vm = this;
      vm.ctrlName = 'SignUpCtrl';

      $rootScope.$broadcast('stopLoader');

      return vm;
    });
})();
