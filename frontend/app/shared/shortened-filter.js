(function () {
  'use strict';

  /*
   * @ngdoc filter
   * @name shared.filter:shortenedCurrency
   * @description
   * @param {String} An amount in dollars to shorten
   * @param {Boolean} Have the suffix (M, B, T) in the return
   * @param {String} Scale (M, B, T) the return should be in. Using 'M' on 100000 -> $0.1M
   * @returns {String} The dollar amount scaled with a currency symbol and prefix symbol
   */
  angular.module('shared')
    .filter('shortened', function () {
      return function (input, prefix, useSuffix, scale) {
        var billion, million, suffix, thousand, tmp, trillion;
        if (useSuffix === null || useSuffix === undefined) {
          useSuffix = true;
        }
        tmp = parseInt(input);
        if (isNaN(tmp)) {
          return 'N/A';
        }
        prefix = prefix || '';
        thousand = 1000;
        million = 1000000;
        billion = 1000000000;
        trillion = 1000000000000;
        if (scale) {
          suffix = scale;
          if (scale === 'T') {
            tmp = tmp / trillion;
          } else if (scale === 'B') {
            tmp = tmp / billion;
          } else if (scale === 'M') {
            tmp = tmp / million;
          } else if (scale === 'k') {
            tmp = tmp / thousand;
          }
        } else {
          suffix = '';
          if (tmp >= trillion) {
            suffix = 'T';
            tmp = tmp / trillion;
          } else if (tmp >= billion) {
            suffix = 'B';
            tmp = tmp / billion;
          } else if (tmp >= million) {
            suffix = 'M';
            tmp = tmp / million;
          } else if (tmp >= thousand) {
            suffix = 'k';
            tmp = tmp / thousand;
          }
        }
        if (!useSuffix) {
          suffix = '';
        }
        return prefix + Math.round(tmp * 100) / 100 + suffix;
      };
    });
})();
