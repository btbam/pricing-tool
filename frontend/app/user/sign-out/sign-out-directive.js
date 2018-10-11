(function () {
  'use strict';

  angular.module('user')
    .directive('signOut', function () {
      return {
        restrict: 'AE',
        scope: {},
        templateUrl: 'user/sign-out/sign-out-directive.tpl.html',
        replace: false,
        controllerAs: 'signOut',
        controller: function () {
          var vm;
          vm = this;
          vm.name = 'signOut';

          return vm;
        }
      };
    });

})();
