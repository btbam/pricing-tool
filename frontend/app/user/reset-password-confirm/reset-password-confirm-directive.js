(function () {
  'use strict';

  angular.module('user')
    .directive('resetPasswordConfirm', function () {
      return {
        restrict: 'AE',
        scope: {},
        templateUrl: 'user/reset-password-confirm/reset-password-confirm-directive.tpl.html',
        replace: false,
        controllerAs: 'resetPasswordConfirm',
        controller: function ($auth, $rootScope, $location, $scope, User) {
          var location, vm;
          $scope.message = '';
          $scope.passwordChanged = false;
          location = $location;
          vm = this;
          vm.name = 'resetPasswordConfirm';
          vm.reset_password_token = localStorage.getItem('reset_password_token');

          $scope.submit = function () {
            var passwordParam;
            if (Object.keys($scope.password_reset_confirm.$error).length > 0) {
              return false;
            }
            $scope.user.reset_password_token = vm.reset_password_token;
            passwordParam = $scope.user;
            User.resetPasswordConfirm(passwordParam)
              .success(function (data) {
                localStorage.removeItem('reset_password_token');
                if ($scope.shouldTrack) {
                  $analytics.eventTrack('Reset Password Confirm');
                }
                return $auth.login({
                    user: {
                      email: data.email,
                      password: $scope.user.password
                    }
                  })
                  .then(function () {
                    sessionStorage.setItem('username', data.email);
                    $rootScope.$broadcast('setHeaderData', data);
                    $location.url('search');
                  });
              })
              .error(function (data) {
                localStorage.removeItem('reset_password_token');
                $rootScope.$broadcast('setHeaderData', data);
                $location.url('resetPassword');
              });
          };

          if (!vm.reset_password_token) {
            $location.url('signIn');
          }
          localStorage.removeItem('reset_password_token');

        }
      };
    });

})();
