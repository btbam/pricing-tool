(function () {
  'use strict';

  angular
    .module('errorHandler')
    .factory('responseInterceptor', function ($location, $q, $rootScope, CheckNested) {
      var response, responseError;

      response = function (response) {
        return response || $q.when(response);
      };

      responseError = function (response) {
        $rootScope.$broadcast('closeFlashMessage');

        response.message = CheckNested.checkNested(response, 'data', 'error') ?
          response.data.error :
          'The server encountered a temporary error and could not complete your request. Please try again.';

        if (response.status === 401) {
          $location.url('signin');
        }

        $rootScope.$broadcast('flashMessage', {
          message: response.message,
          type: 'info'
        });

        $rootScope.$broadcast('stopLoader');
        return $q.reject(response);
      };

      return {
        response: response,
        responseError: responseError
      };
    });
})();
