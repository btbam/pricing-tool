(function () {
  'use strict';

  angular.module('shared')
    .factory('State', function ($state) {
      return {
        currentState: function () {
          return $state;
        }
      };
    });
})();
