(function () {
  'use strict';

  angular.module('shared')
    .filter('formatZeroOrNA', function () {
      return function (input) {
        if (typeof input !== 'undefined' && input !== null && input !== 'null') {
          return input.toString();
        } else if (input === 0) {
          return '0';
        } else {
          return 'N/A';
        }
      };
    });
})();
