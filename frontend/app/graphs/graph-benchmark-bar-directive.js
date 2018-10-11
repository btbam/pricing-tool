(function () {
  'use strict';

  angular.module('graphs')
    .directive('graphBenchmarkBar', function ($timeout) {
      return {
        restrict: 'E',
        templateUrl: 'graphs/graph-benchmark-bar-directive.tpl.html',
        controllerAs: 'graphBenchmarkBar',
        controller: function () {
          var vm;
          vm = this;
          vm.name = 'graphBenchmarkBar';
        },
        link: function (scope, elem, attrs) {
          scope.showBenchmark = false;
          attrs.$observe('graphdata', function () {
            var ballpark, ballparkPercentChange, ballparkPercentChangeDirection,
                benchmark, dataset, expiringGWP, GRAPH_WIDTH, RANGE;

            if (attrs.graphdata.length === 0) {
              return false;
            } else {
              dataset = JSON.parse(attrs.graphdata);
            }

            GRAPH_WIDTH = 378;
            ballpark = Math.round(parseFloat(dataset.ballpark));
            benchmark = Math.round(parseFloat(dataset.benchmark));

            if (isNaN(dataset.gwp)) {
              expiringGWP = 0;
            } else {
              expiringGWP = Math.round(parseFloat(dataset.gwp));
            }

            RANGE = 2 * benchmark;

            ballparkPercentChange = dataset.ballparkPercentChange;
            ballparkPercentChangeDirection =
              dataset.ballparkPercentChangeDirection;

            scope.benchmark = {
              ballpark: {
                value: ballpark,
                percentChange: ballparkPercentChange,
                percentChangeDirection: ballparkPercentChangeDirection
              },
              benchmark: {
                value: benchmark
              },
              expiringGWP: {
                value: expiringGWP
              }
            };

            scope.showBenchmark = true;
            return $timeout(function () {

              if ((ballpark / RANGE) >= 1) {
                scope.benchmark.ballpark.position = GRAPH_WIDTH;
              } else if (ballpark === 0) {
                scope.benchmark.ballpark.position = GRAPH_WIDTH / 2;
              } else if ((ballpark / RANGE) * GRAPH_WIDTH < 1) {
                scope.benchmark.ballpark.position = 0;
              } else {
                scope.benchmark.ballpark.position = (ballpark / RANGE) * GRAPH_WIDTH;
              }

              if ((expiringGWP / RANGE) >= 1) {
                scope.benchmark.expiringGWP.position = 0;
              } else if (expiringGWP === 0) {
                scope.benchmark.expiringGWP.position = GRAPH_WIDTH / 2;
              } else if ((expiringGWP / RANGE) * GRAPH_WIDTH < 1) {
                scope.benchmark.expiringGWP.position = GRAPH_WIDTH;
              } else {
                scope.benchmark.expiringGWP.position = GRAPH_WIDTH - ((expiringGWP / RANGE) * GRAPH_WIDTH);
              }

              scope.benchmark.benchmark.position =  GRAPH_WIDTH / 2;
            }, 500);
          });
        }
      };
    });
})();
