(function () {
  'use strict';

  angular.module('graphs')
    .directive('graphRateNeedBar', function ($timeout) {
      return {
        restrict: 'E',
        templateUrl: 'graphs/graph-rate-need-bar-directive.tpl.html',
        controllerAs: 'graphRateNeedBar',
        controller: function () {
          var vm;
          vm = this;
          vm.name = 'graphRateNeedBar';
        },
        link: function (scope, elem, attrs) {
          scope.showRateNeed = false;

          scope.colorBasedOnValueRateNeed = function (set_value) {
            if (set_value <= 0) {
              return 'arrow-green';
            } else if (set_value <= 5) {
              return 'arrow-yellow-light';
            } else if (set_value <= 10) {
              return 'arrow-yellow';
            } else if (set_value <= 20) {
              return 'arrow-orange';
            } else {
              return 'arrow-red';
            }
          };

          scope.positionBasedOnValueRateNeed = function (set_value) {
            var graph_height = 188;
            if (set_value <= 0) {
              return 4.5 * graph_height / 5;
            } else if (set_value <= 5) {
              return 3.5 * graph_height / 5;
            } else if (set_value <= 10) {
              return 2.5 * graph_height / 5;
            } else if (set_value <= 20) {
              return 1.5 * graph_height / 5;
            } else {
              return 0.5 * graph_height / 5;
            }
          };

          attrs.$observe('graphdata', function () {
            var averageValue, companyValue, dataset, GRAPH_HEIGHT;

            if (attrs.graphdata.length === 0) {
              return false;
            } else {
              dataset = JSON.parse(attrs.graphdata);
            }

            GRAPH_HEIGHT = 188;
            companyValue = Math.round(parseFloat(dataset.company));
            averageValue = Math.round(parseFloat(dataset.group));

            if ((companyValue / 100) * GRAPH_HEIGHT < 1) {
              companyValue = 0;
            } else if ((companyValue / 100) > 1) {
              companyValue = 100;
            }

            if ((averageValue / 100) * GRAPH_HEIGHT < 1) {
              averageValue = 0;
            } else if ((averageValue / 100) > 1) {
              averageValue = 100;
            }

            scope.rateNeed = {
              company: {
                value: companyValue,
                color_range: 'default'
              },
              average: {
                value: averageValue,
                color_range: 'default'
              }
            };

            scope.showRateNeed = true;

            return $timeout(function () {
              scope.rateNeed.company.position = (companyValue / 100) * GRAPH_HEIGHT;
              scope.rateNeed.average.position = (averageValue / 100) * GRAPH_HEIGHT;
            }, 500);
          });
        }
      };
    });
})();
