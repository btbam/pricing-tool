(function () {
  'use strict';

  angular.module('graphs')
    .directive('graphFinancialStressBar', function ($timeout) {
      return {
        restrict: 'E',
        templateUrl: 'graphs/graph-financial-stress-bar-directive.tpl.html',
        controllerAs: 'graphFinancialStressBar',
        controller: function () {
          var vm;
          vm = this;
          vm.name = 'graphFinancialStressBar';
        },
        link: function (scope, elem, attrs) {
          scope.showStressScore = false;
          scope.colorBasedOnValue = function (set_value) {
            if (set_value > 1680) {
              return 'arrow-green';
            } else if (set_value > 1510) {
              return 'arrow-yellow-light';
            } else if (set_value > 1340) {
              return 'arrow-yellow';
            } else if (set_value > 1170) {
              return 'arrow-orange';
            } else {
              return 'arrow-red';
            }
          };

          attrs.$observe('graphdata', function () {
            var LEFT_OFFSET, GRAPH_WIDTH, STRESS_MAX, STRESS_MIN, averageValue, companyValue, dataset,
              range;

            if (attrs.graphdata.length === 0) {
              return false;
            } else {
              dataset = JSON.parse(attrs.graphdata);
            }

            LEFT_OFFSET = 0;
            GRAPH_WIDTH = 378;
            STRESS_MIN = 1000;
            STRESS_MAX = 1850;
            range = STRESS_MAX - STRESS_MIN;
            companyValue = parseInt(dataset.company, 10);
            averageValue = parseInt(dataset.average, 10);

            scope.stressScore = {
              max: STRESS_MAX,
              company: {
                value: companyValue,
                position: 0,
                color_range: 'default'
              },
              average: {
                value: averageValue,
                position: 0,
                color_range: 'default'
              }
            };

            scope.stressScore.company.position = -1 * LEFT_OFFSET;
            scope.stressScore.average.position = -1 * LEFT_OFFSET;
            scope.showStressScore = true;

            return $timeout(function () {
              if (companyValue < 1000) {
                companyValue = 1000;
              }
              if (averageValue < 1000) {
                averageValue = 1000;
              }
              scope.stressScore.company.position = ((companyValue - STRESS_MIN) / range) * GRAPH_WIDTH;
              scope.stressScore.average.position = ((averageValue - STRESS_MIN) / range) * GRAPH_WIDTH;
              scope.stressScore.company.color_range = scope.colorBasedOnValue(companyValue);
              scope.stressScore.average.color_range = scope.colorBasedOnValue(averageValue);
            }, 500);
          });
        }
      };
    });
})();
