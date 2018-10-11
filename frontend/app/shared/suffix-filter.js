(function () {
  'use strict';

  angular.module('shared')
    .filter('suffix', function () {
      return function (input) {
        var billion, million, suffix, thousand, tmp, trillion;
        tmp = parseInt(input);
        if (isNaN(tmp)) {
          return '';
        }
        thousand = 1000;
        million = 1000000;
        billion = 1000000000;
        trillion = 1000000000000;
        suffix = '';

        if (tmp >= trillion) {
          suffix = 'T';
        } else if (tmp >= billion) {
          suffix = 'B';
        } else if (tmp >= million) {
          suffix = 'M';
        } else if (tmp >= thousand) {
          suffix = 'k';
        }

        return suffix;
      };
    });
})();
