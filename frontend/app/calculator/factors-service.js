(function () {
  'use strict';

  /**
    * @ngdoc service
    * @name calculator.service:Factors

    * @description
   */
  var Factors,
    slice = [].slice;

  Factors = (function () {
    function Factors() {
      this.name = 'Factors';
    }

    Factors.prototype.blendedBaseRate = function (caEmployeeCount, dcflmitxEmployeeCount, otherEmployeeCount) {
      var totalRatableEmployees = caEmployeeCount + dcflmitxEmployeeCount + otherEmployeeCount;
      if (totalRatableEmployees === 0) {
        return 0;
      } else {
        return this.round(caEmployeeCount / totalRatableEmployees * 3.2, 3) +
          this.round(dcflmitxEmployeeCount / totalRatableEmployees * 1.28, 3) +
          this.round(otherEmployeeCount / totalRatableEmployees, 3);
      }
    };

    Factors.prototype.checkFactorErrors = function (input, min, neutral, max) {
      if (!input) {
        return neutral;
      }
      if (typeof input === 'string' && input.charAt(0) === '.') {
        if (!input.charAt(1)) {
          return neutral;
        }
      }
      if (typeof input === 'string' && input.charAt(0) !== '.') {
        if (!(input = parseFloat(input))) {
          return neutral;
        }
      }
      input = parseFloat(input);
      if (input > max) {
        return max;
      } else if (input < min) {
        return min;
      } else {
        return input;
      }
    };

    Factors.prototype.checkFactorErrorsEpli = function (input, data) {
      var min, max;
      min = data[0];
      max = data[1];

      if (!input) {
        return min;
      }
      if (typeof input === 'string' && input.charAt(0) === '.') {
        if (!input.charAt(1)) {
          return min;
        }
      }
      if (typeof input === 'string' && input.charAt(0) !== '.') {
        if (!(input = parseFloat(input))) {
          return min;
        }
      }
      input = parseFloat(input);
      if (input > max) {
        return max;
      } else if (input < min) {
        return min;
      } else {
        return input;
      }
    };

    Factors.prototype.claimsHistory = function (frequencyFactor, severityFactor) {
      return this.multiplier(frequencyFactor, severityFactor);
    };

    Factors.prototype.financialCondition = function (balanceSheetFactor, incomeStatementFactor,
      statementofCashFlowFactor, allOtherFinancialFactor) {
      return this.multiplier(balanceSheetFactor, incomeStatementFactor, statementofCashFlowFactor,
        allOtherFinancialFactor);
    };

    Factors.prototype.getEmployeeTotalMenuSelect = function (totalNumberOfEmployees) {
      var max, min, values, menu_select, menu = [
        '1 - 4',
        '4 - 9',
        '10 - 19',
        '20 - 49',
        '50 - 99',
        '100 - 249',
        '250 - 499',
        '500 - 999'
      ];

      if (totalNumberOfEmployees === 0) {
        menu_select = 'Missing';
      } else if (totalNumberOfEmployees > 999) {
        menu_select = '999+';
      } else {
        _.each(menu, function (bin) {
          values = bin.split('-');
          min = parseInt(values[0]);
          max = parseInt(values[1]);
          if ((min <= totalNumberOfEmployees) && (totalNumberOfEmployees <= max)) {
            menu_select = bin;
          } else if (min === 1 && totalNumberOfEmployees > 0) {
            menu_select = bin;
          }
        });
      }

      return menu_select;
    };

    Factors.prototype.litigationFactor = function (DOLitigationFactor, otherCorporateLitigationFactor) {
      return this.multiplier(DOLitigationFactor, otherCorporateLitigationFactor);
    };

    Factors.prototype.multiplier = function () {
      var factor, hasNA, i, len, num, nums;
      nums = arguments.length >= 1 ? slice.call(arguments, 0) : [];
      hasNA = false;
      nums.forEach(function (n) {
        if (typeof n !== 'number') {
          hasNA = true;
        }
      });
      if (hasNA) {
        return 'N/A';
      }
      factor = 1;
      for (i = 0, len = nums.length; i < len; i++) {
        num = nums[i];
        factor = factor * num;
      }
      return factor;
    };

    Factors.prototype.offManual = function (benchmark, finalPremium) {
      return benchmark !== 0 ? (finalPremium / benchmark) : 0;
    };

    Factors.prototype.privateCompanyModifier = function (DOPercentPrivateStock, ESOPOwnership, initialPOFactor,
      publicDebt, privatePlacements, nonEntityEPLI, boardsAndAuditors) {

      /*
      PRIVATE COMPANY MODIFIER =
        D&O % of Private Stock Factor x
        ESOP Ownership Factor x
        Initial Public Offering Factor x
        Institution of Appropriate Compliance/Governance Standards Factor x
        Public Debt Factor x
        Private Placements Factor x
        Non-Entity EPLI Factor x
        Boards and Auditors Factor
       */
      return this.multiplier(DOPercentPrivateStock, ESOPOwnership, initialPOFactor, publicDebt,
        privatePlacements,
        nonEntityEPLI, boardsAndAuditors);
    };

    Factors.prototype.ratableEmployees = function (employees, jurisdiction) {
      if (!employees || !employees.full || !employees.part) { return 0; }

      switch (jurisdiction){
        case 'CA':
          return (employees.full.union     * 0.5) + (employees.part.union * 0.5) +
                 (employees.full.non_union * 1)   + (employees.part.non_union * 0.5);
        case 'DCFLMITX':
          return (employees.full.union     * 0.5) + (employees.part.union     * 0.5) +
                 (employees.full.non_union * 1)   + (employees.part.non_union * 0.5);
        default:
          return (employees.full.union     * 0.5)  + (employees.part.union     * 0.5) +
                 (employees.full.non_union * 1)    + (employees.part.non_union * 0.5) +
                 (employees.full.foreign   * 0.25) + (employees.part.foreign   * 0.125);
      }
    };

    Factors.prototype.round = function (original, places) {
      var multiplier = places ? Math.pow(10, places) : 1;
      return Math.round(original * multiplier) / multiplier;
    };

    Factors.prototype.specialtyCoverage = function (damageCoverageFactor, priorActsCoverageFactor) {
      return this.multiplier(damageCoverageFactor, priorActsCoverageFactor);
    };

    Factors.prototype.yearsInOperation = function (years) {
      if (years > 5) {
        return {
          midpoint: 0.93,
          min: 0.85,
          max: 1
        };
      } else if (years >= 3 && years <= 5) {
        return {
          midpoint: 1.03,
          min: 1,
          max: 1.05
        };
      } else {
        return {
          midpoint: 1.15,
          min: 1.05,
          max: 1.25
        };
      }
    };

    Factors.prototype.yearsInOperationEpli = function (years) {
      if (years > 5) {
        return {
          midpoint: 0.925,
          min: 0.85,
          max: 1
        };
      } else if (years >= 3 && years <= 5) {
        return {
          midpoint: 1.025,
          min: 1,
          max: 1.05
        };
      } else {
        return {
          midpoint: 1.15,
          min: 1.05,
          max: 1.25
        };
      }
    };

    return Factors;

  })();

  angular.module('calculator')
    .service('Factors', Factors);
})();
