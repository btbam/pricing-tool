(function () {
  'use strict';

  angular.module('user')
    .controller('SignInCtrl', function ($rootScope, $state, $auth) {
      var vm;
      vm = this;
      vm.ctrlName = 'SignInCtrl';
      if ($auth.isAuthenticated()) {
        $state.go('search');
      } else {
        $rootScope.$broadcast('setHeaderData');
      }
      $rootScope.$broadcast('stopLoader');
      return vm;
    });

})();
