(function () {
  'use strict';

  angular.module('user')
    .directive('signUp', function () {
      return {
        restrict: 'AE',
        scope: {},
        templateUrl: 'user/sign-up/sign-up-directive.tpl.html',
        replace: false,
        controllerAs: 'signUp',
        controller: function ($analytics, $auth, $location, $rootScope, $scope) {
          var location, vm;
          $scope.message = '';
          location = $location;
          vm = this;
          vm.name = 'signUp';

          vm.submit = function (user, errors) {
            var userParam;
            userParam = {
              user: user
            };
            if (Object.keys(errors)
              .length > 0) {
              return false;
            }

            $auth.signup(userParam)
              .then(function (response) {
                sessionStorage.setItem('username', response.data.email);
                $rootScope.$broadcast('setHeaderData', response.data);
                if ($scope.shouldTrack) {
                  $analytics.eventTrack('Sign Up');
                }
                location.url('search');
              }, function (response) {
                sessionStorage.removeItem('username');
                localStorage.removeItem('username');
                $rootScope.$broadcast('setHeaderData', response.data);
                $scope.message = response.data.error;
              });
          };

          return vm;
        }
      };
    });
})();
