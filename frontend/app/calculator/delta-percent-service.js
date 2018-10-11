(function () {
  'use strict';

  var DeltaPercent;

  DeltaPercent = (function () {
    function DeltaPercent() {
      this.name = 'DeltaPercent';
    }

    DeltaPercent.prototype.get = function (base, compare) {
      var change;
      change = ((compare - base) / base) * 100;

      if (change < 0) {
        return {
          percent_change: Math.round(change * -1) + '%',
          percent_change_direction: 'down'
        };
      } else if (change >= 0 && change !== Infinity) {
        return {
          percent_change: Math.round(change) + '%',
          percent_change_direction: 'up'
        };
      } else {
        return {
          percent_change: '',
          percent_change_direction: ''
        };
      }
    };

    return DeltaPercent;

  })();

  angular.module('calculator')
    .service('DeltaPercent', DeltaPercent);
})();
