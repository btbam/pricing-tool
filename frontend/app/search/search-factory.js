(function () {
  'use strict';

  angular.module('search')
    .factory('Search', function ($http) {
      var SearchBase;
      SearchBase = {};

      SearchBase.get = function (url, params, timeout) {
        return $http({
            method: 'GET',
            timeout: timeout || 0,
            url: url,
            params: params
          })
          .then(function (response) {
            return response;
          });
      };

      return SearchBase;
    });

})();
