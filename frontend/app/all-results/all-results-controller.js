(function () {
  'use strict';

  angular.module('all-results')
    .controller('AllResultsCtrl', function ($rootScope, $location, $auth) {
      var vm;
      vm = this;
      vm.ctrlName = 'AllResultsCtrl';

      if (!$auth.isAuthenticated()) {
        $location.url('signin');
      }

      $rootScope.$broadcast('stopLoader');

      return vm;
    });
})();
