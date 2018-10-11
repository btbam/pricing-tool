(function () {
  'use strict';

  angular.module('user')
    .controller('SignOutCtrl', function ($auth, $rootScope) {
      var vm;
      vm = this;
      vm.ctrlName = 'SignOutCtrl';

      vm.signout = function () {
        $auth.logout()
          .then(function () {
            sessionStorage.removeItem('username');
            if (!localStorage.getItem('remember')) {
              localStorage.removeItem('username');
            }
            $rootScope.$broadcast('setHeaderData');
            return $rootScope.$broadcast('stopLoader');
          }, function () {
            $rootScope.$broadcast('stopLoader');
          });
      };

      vm.signout();

      return vm;
    });

})();
