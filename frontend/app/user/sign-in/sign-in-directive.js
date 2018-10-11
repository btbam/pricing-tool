(function () {
  'use strict';

  angular.module('user')
    .directive('signIn', function () {
      return {
        restrict: 'AE',
        templateUrl: 'user/sign-in/sign-in-directive.tpl.html',
        replace: false,
        controllerAs: 'signIn',
        controller: function ($analytics, $auth, $location, $rootScope, $scope, $state) {
          var state, vm;
          $scope.user = {};
          $scope.user.email = localStorage.getItem('username');
          $scope.user.remember = localStorage.getItem('remember') === 'true' ? true : false;
          state = $state;
          vm = this;
          vm.name = 'signIn';
          vm.message = '';

          $scope.submit = function () {
            var userParam;
            if (Object.keys($scope.sign_in.$error).length > 0) {
              return false;
            }
            userParam = {
              user: $scope.user
            };
            return $auth.login(userParam)
              .then(function (response) {
                vm.message = 'success';
                if ($scope.shouldTrack) {
                  $analytics.setUserProperties({
                    name: $scope.user.email,
                    email: $scope.user.email,
                    last_login: new Date()
                  });
                  $analytics.eventTrack('Log In');
                }
                if (userParam.user.remember) {
                  localStorage.setItem('remember', true);
                  localStorage.setItem('username', userParam.user.email);
                } else {
                  localStorage.removeItem('remember');
                  sessionStorage.setItem('username', userParam.user.email);
                }
                $rootScope.$broadcast('setHeaderData', response.data);
                $rootScope.$broadcast('closeFlashMessage');
                return $location.url('search');
              }, function (error) {
                $rootScope.$broadcast('setHeaderData', error.data);
                vm.message = error.data.error;
              });
          };

          return vm;
        }
      };
    });

})();
