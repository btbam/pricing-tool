(function () {
  'use strict';

  /*
   * @ngdoc filter
   * @name shared.filter:zipCode
   * @description
   * @param {String} input The zip code to filter
   * @returns {String} The filtered zip code
   */
  angular.module('shared')
    .filter('zipCode', function () {
      return function (input) {
        var tmp;
        tmp = parseInt(input);
        if (input.length !== 9 || isNaN(tmp)) {
          return input;
        }
        return input.substring(0, 5) + '-' + input.substring(5);
      };
    });
})();
