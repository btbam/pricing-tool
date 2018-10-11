(function () {
  'use strict';

  angular.module('spEntity', ['ui.router']);

  angular.module('spEntity')
    .config(function ($stateProvider) {
      return $stateProvider.state('spEntity', {
        url: '/entity/:duns_number/:username?password&sp_token',
        onEnter: function ($auth, $location, $rootScope, $state, $stateParams, SP_TOKEN) {
          var dunsNumber, password, token, userName, userParams;

          dunsNumber = $stateParams.duns_number;
          userName = $stateParams.username;
          password = $location.$$search.password;
          token = $location.$$search.sp_token;
          userParams = {
            user: {
              email: userName,
              password: password,
              remember: true,
              sp_token: token
            }
          };

          function login () {
            $auth.login(userParams)
              .then(function (response) {
                if (userParams.user.remember) {
                  localStorage.setItem('remember', true);
                  localStorage.setItem('username', userParams.user.email);
                } else {
                  localStorage.removeItem('remember');
                  sessionStorage.setItem('username', userParams.user.email);
                }
                $rootScope.$broadcast('setHeaderData', response.data);
                $rootScope.$broadcast('closeFlashMessage');
                $state.go('entity', {duns_number: dunsNumber});
              }, function (response) {
                console.log(response);
                signout();
              });
          }

          function signout () {
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
          }

          if (token === SP_TOKEN) {
            login();
          } else {
            console.log('token failed');
            $location.url('signin');
          }
        }
      });
    });
})();
