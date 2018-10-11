(function () {
  'use strict';

  angular.module('shared')
    .service('CheckNested', function () {
      var self;
      self = this;

      self.checkNested = function (obj) {
        var i, args = Array.prototype.slice.call(arguments, 1);

        for (i = 0; i < args.length; i++) {
          if (!obj || !obj.hasOwnProperty(args[i])) {
            return false;
          }
          obj = obj[args[i]];
        }

        return true;
      };
    });
})();
