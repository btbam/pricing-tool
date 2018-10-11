(function () {
  'use strict';

  angular.module('shared')
    .filter('formatPercentFromNumber', function () {
      return function (input) {
        var tmp;

        if (typeof input !== 'undefined' && input !== null && input !== 'null') {
          tmp = parseFloat(input, 10);
          tmp = tmp * 100;
          tmp = Math.round(tmp);
          return tmp;
        }

        return 0;
      };
    });
})();
