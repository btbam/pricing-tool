(function () {
  'use strict';

  angular.module('search')
    .controller('SearchCtrl', function ($auth, $location, $rootScope, Idle) {
      var vm;
      vm = this;
      vm.ctrlName = 'SearchCtrl';

      Idle.watch();

      if (!$auth.isAuthenticated()) {
        $location.url('signin');
      }

      $rootScope.$broadcast('stopLoader');

      return vm;
    });

})();
