(function () {
  'use strict';

  angular.module('entity')
    .controller('EntityCtrl', function ($auth, $location, $rootScope, Idle) {
      var vm;
      vm = this;
      vm.ctrlName = 'EntityCtrl';

      Idle.watch();

      if (!$auth.isAuthenticated()) {
        $location.url('signin');
      }

      $rootScope.$broadcast('stopLoader');

      return vm;
    });

})();
