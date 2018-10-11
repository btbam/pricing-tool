(function () {
  'use strict';

  angular.module('summary')
    .controller('SummaryCtrl', function ($auth, $location, $rootScope) {
      var vm;
      vm = this;
      vm.ctrlName = 'SummaryCtrl';

      if (!$auth.isAuthenticated()) {
        $location.url('signin');
      }

      $rootScope.$broadcast('stopLoader');

      return vm;
    });
})();
