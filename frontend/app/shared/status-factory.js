(function () {
  'use strict';

  angular.module('shared')
    .factory('Status', function ($http, API_PATH) {
      return {
        currentStatus: function () {
          return $http.get(API_PATH + '/api/status/')
            .then(function (data) {
              data = data.data;
              if (data === null) {
                return false;
              }
              return data;
            });
        }
      };
    });
})();
