(function () {
  'use strict';

  angular.module('calculator')
    .service('BasePremium', function (DOBasePremiumData, EPLIBasePremiumData) {
      this.epliData = EPLIBasePremiumData.data;
      this.finInst = DOBasePremiumData.finInst;
      this.name = 'BasePremium';
      this.nonFinInst = DOBasePremiumData.nonFinInst;

      this.calculateEPLI = function (ratableEmployee, lower, upper) {
        var value;
        value = ratableEmployee *
        (lower.ratableEmployee - (ratableEmployee - lower.employee) / (upper.employee - lower.employee) *
        (lower.ratableEmployee - upper.ratableEmployee));
        return value;
      };

      this.getDO = function (isFinancialInstitution, assetSize) {
        var t, table, value;
        t = this;
        value = 0;
        if (isFinancialInstitution === 1) {
          table = this.finInst;
        } else {
          table = this.nonFinInst;
        }
        if ((assetSize === '') || (parseInt(assetSize) === 0)) {
          value = 0;
        } else {
          angular.forEach(table, function (k) {
            if (assetSize <= k.highEnd && assetSize >= k.lowEnd) {
              value = ((assetSize - k.lowEnd) / k.step * k.marginalRate) + k.initialPremium;
            }
          });
        }
        return value;
      };

      this.getEPLI = function (ratableEmployee) {
        var t, table, value;
        this.ratableEmployee = ratableEmployee;
        table = this.epliData;
        t = this;
        angular.forEach(table, function (row, index) {
          if (t.ratableEmployee <= 25 && t.ratableEmployee >= 0) {
            value = t.ratableEmployee * row.ratableEmployee;
          } else if (t.ratableEmployee <= row.highEnd && t.ratableEmployee >= row.lowEnd) {
            value = t.calculateEPLI(t.ratableEmployee, table[index - 1], row);
          }
        });
        return value;
      };
    });
})();
