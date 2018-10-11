(function () {
  'use strict';

  angular.module('user')
    .directive('resetPassword', function () {
      return {
        restrict: 'AE',
        scope: {},
        templateUrl: 'user/reset-password/reset-password-directive.tpl.html',
        replace: false,
        controllerAs: 'resetPassword',
        controller: function ($location, $rootScope, $scope, $stateParams, User) {
          var location, vm;
          $scope.message = '';
          location = $location;
          vm = this;
          vm.name = 'resetPassword';

          $scope.submit = function (user, errors) {
            var userParam;
            if (errors.length > 0) {
              return false;
            }
            userParam = {
              user: user
            };
            return User.resetPassword(userParam)
              .success(function (data, status) {
                if (status === 201) {
                  localStorage.setItem('reset_password_token', data.reset_password_token);
                  if ($scope.shouldTrack) {
                    $analytics.eventTrack('Reset Password');
                  }
                  location.url('resetpasswordconfirm');
                } else if (status === 200) {
                  vm.checkEmail = true;
                } else {
                  $rootScope.$broadcast('flashMessage', {
                      message: 'There was an error resetting your password. Please try again later.'
                    }, localStorage.removeItem('username'), sessionStorage.removeItem('username'),
                    localStorage.removeItem('reset_password_token'));
                  location.url('search');
                }
              })
              .error(function (data) {
                sessionStorage.removeItem('username');
                localStorage.removeItem('username');
                localStorage.removeItem('reset_password_token');
                $rootScope.$broadcast('setHeaderData', data);
                $scope.message = data.error;
              });
          };

          if ($stateParams.reset_password_token !== '' && $stateParams.reset_password_token !== null) {
            localStorage.setItem('reset_password_token', $stateParams.reset_password_token);
            if ($scope.shouldTrack) {
              $analytics.eventTrack('Reset Password');
            }

            $location.url('resetpasswordconfirm');
          }
        }
      };
    });

})();
