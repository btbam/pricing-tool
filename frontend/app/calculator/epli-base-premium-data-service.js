(function () {
  'use strict';

  /**
    * @ngdoc service
    * @name calculator.service: BasePremiumData

    * @description
   */
  var EPLIBasePremiumData;

  EPLIBasePremiumData = (function () {
    function EPLIBasePremiumData () {
      this.data =
          [{employee:25,
            ratableEmployee:200.03,
            lowEnd:0,
            highEnd:25},
            {employee:50,
            ratableEmployee:154.26,
            lowEnd:25,
            highEnd:50},
            {employee:75,
            ratableEmployee:117.85,
            lowEnd:50,
            highEnd:75},
            {employee:100,
            ratableEmployee:98.51,
            lowEnd:75,
            highEnd:100},
            {employee:125,
            ratableEmployee:86.56,
            lowEnd:100,
            highEnd:125},
            {employee:150,
            ratableEmployee:78.3,
            lowEnd:125,
            highEnd:150},
            {employee:200,
            ratableEmployee:65.5,
            lowEnd:150,
            highEnd:200},
            {employee:250,
            ratableEmployee:56.77,
            lowEnd:200,
            highEnd:250},
            {employee:500,
            ratableEmployee:37.8,
            lowEnd:250,
            highEnd:500},
            {employee:1000,
            ratableEmployee:28,
            lowEnd:500,
            highEnd:1000},
            {employee:1500,
            ratableEmployee:25.23,
            lowEnd:1000,
            highEnd:1500},
            {employee:2500,
            ratableEmployee:20.83,
            lowEnd:1500,
            highEnd:2500},
            {employee:5000,
            ratableEmployee:19.55,
            lowEnd:2500,
            highEnd:5000},
            {employee:10000,
            ratableEmployee:19.1,
            lowEnd:5000,
            highEnd:10000},
            {employee:15000,
            ratableEmployee:15.15,
            lowEnd:10000,
            highEnd:15000},
            {employee:20000,
            ratableEmployee:12.81,
            lowEnd:15000,
            highEnd:20000},
            {employee:25000,
            ratableEmployee:10.8,
            lowEnd:20000,
            highEnd:25000},
            {employee:30000,
            ratableEmployee:9.3,
            lowEnd:25000,
            highEnd:30000},
            {employee:35000,
            ratableEmployee:8.29,
            lowEnd:30000,
            highEnd:35000},
            {employee:40000,
            ratableEmployee:7.77,
            lowEnd:35000,
            highEnd:40000},
            {employee:45000,
            ratableEmployee:7.33,
            lowEnd:40000,
            highEnd:45000},
            {employee:50000,
            ratableEmployee:7.12,
            lowEnd:45000,
            highEnd:50000},
            {employee:55000,
            ratableEmployee:6.91,
            lowEnd:50000,
            highEnd:55000},
            {employee:60000,
            ratableEmployee:6.7,
            lowEnd:55000,
            highEnd:60000},
            {employee:65000,
            ratableEmployee:6.49,
            lowEnd:60000,
            highEnd:65000},
            {employee:70000,
            ratableEmployee:6.3,
            lowEnd:65000,
            highEnd:70000},
            {employee:75000,
            ratableEmployee:6.09,
            lowEnd:70000,
            highEnd:75000},
            {employee:80000,
            ratableEmployee:5.91,
            lowEnd:75000,
            highEnd:80000},
            {employee:85000,
            ratableEmployee:5.75,
            lowEnd:80000,
            highEnd:85000},
            {employee:90000,
            ratableEmployee:5.57,
            lowEnd:85000,
            highEnd:90000},
            {employee:95000,
            ratableEmployee:5.4,
            lowEnd:90000,
            highEnd:95000},
            {employee:100000,
            ratableEmployee:5.24,
            lowEnd:95000,
            highEnd:100000},
            {employee:125000,
            ratableEmployee:4.82,
            lowEnd:100000,
            highEnd:125000},
            {employee:150000,
            ratableEmployee:4.43,
            lowEnd:125000,
            highEnd:150000},
            {employee:175000,
            ratableEmployee:4.09,
            lowEnd:150000,
            highEnd:175000},
            {employee:200000,
            ratableEmployee:3.75,
            lowEnd:175000,
            highEnd:200000},
            {employee:250000,
            ratableEmployee:3.37,
            lowEnd:200000,
            highEnd:250000},
            {employee:300000,
            ratableEmployee:3.03,
            lowEnd:250000,
            highEnd:300000}];
    }

    return EPLIBasePremiumData;
  })();

  angular.module('calculator')
    .service('EPLIBasePremiumData', EPLIBasePremiumData);
})();
