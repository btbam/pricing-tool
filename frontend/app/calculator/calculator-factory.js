(function () {
  'use strict';

  angular.module('calculator')
    .factory('Calculator', function ($http, API_PATH) {
      var rtnObj;
      rtnObj = {};
      rtnObj.getData = function (duns_number, sic, force) {
        var url = API_PATH + '/api/entity/' + duns_number + '/calculator';
        return $http.get(url, {params:{default:force, sic_code: sic}})
          .success(function (response) {
            return response;
          })
          .error(function (response, status) {
            console.log('error response', response);
            return console.log('error status', status);
          });
      };

      rtnObj.saveData = function (duns_number, data) {
        var url = API_PATH + '/api/entity/' + duns_number + '/calculator';
        return $http.put(url, data)
          .success(function (response) {
            return response;
          })
          .error(function (response, status) {
            console.log('error response', response);
            return console.log('error status', status);
          });
      };
      return rtnObj;
    });
})();
