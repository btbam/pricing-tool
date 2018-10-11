(function () {
  'use strict';

  angular.module('user')
    .factory('User', function ($http, API_PATH) {
      var UserBase;
      UserBase = {};

      UserBase.deleteHistoryForDuns = function (duns_number) {
        return $http.delete(API_PATH + '/api/user/history/' + duns_number);
      };

      UserBase.getHistory = function () {
        return $http.get(API_PATH + '/api/user/history/');
      };

      UserBase.getHistoryForDuns = function (duns_number) {
        return $http.get(API_PATH + '/api/user/history/' + duns_number);
      };

      UserBase.resetPasswordConfirm = function (passwordParam) {
        return $http.post(API_PATH + '/api/user/password', passwordParam);
      };

      UserBase.resetPassword = function (userParam) {
        return $http.post(API_PATH + '/api/user/password/reset_token', userParam);
      };

      UserBase.signOut = function () {
        return $http['delete'](API_PATH + '/api/session');
      };

      return UserBase;
    });

})();
