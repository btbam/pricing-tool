(function () {
  'use strict';

  angular.module('graphs')
    .directive('graphRadialFinancialHealth', function ($timeout) {
      return {
        restrict: 'E',
        scope: {
          stress: '@',
          credit: '@',
          health: '@'
        },
        templateUrl: 'graphs/graph-radial-financial-health.tpl.html',
        controllerAs: 'graphRadialFinancialHealth',
        controller: function ($scope) {
          var vm, STRESS_MIN, STRESS_MAX, CREDIT_MIN, CREDIT_MAX, polarToCartesian,
           describeArc, delta, STROKE_WIDTH, START_X, START_Y, START_RADIUS, d;

          vm = this;
          vm.name = 'graphRadialFinancialHealth';

          STROKE_WIDTH = 20;
          START_Y = 100;
          START_X = 100;
          START_RADIUS = 35;
          STRESS_MAX = 1850;
          STRESS_MIN = 1150;
          CREDIT_MAX = 990;
          CREDIT_MIN = 500;

          $scope.animateArc = function (id) {
            var path, length;

            path = document.getElementById(id);
            length = path.getTotalLength();
            // Clear any previous transition
            path.style.transition = path.style.WebkitTransition =
              'none';
            // Set up the starting positions
            path.style.strokeDasharray = length + ' ' + length;
            path.style.strokeDashoffset = -1 * length;
            // Trigger a layout so styles are calculated & the browser
            // picks up the starting position before animating
            path.getBoundingClientRect();
            // Define our transition
            path.style.transition = path.style.WebkitTransition =
              'stroke-dashoffset 1s ease-in-out';
            // Go!
            path.style.strokeDashoffset = '0';
          }; // jakearchibald.com/2013/animated-line-drawing-svg/

          $scope.calculate = function () {
            //calculate stress
            $scope.calculateStress();

            // calucalte health
            $scope.calculateHealth();

            // calculate credit value
            $scope.calculateCredit();

            $scope.stress = Math.round($scope.stress);

            $scope.stressValue = $scope.stress;
            $scope.creditValue = $scope.credit;

            // draw background circles
            $scope.drawArc(100, 'bgArc1', START_X, START_Y, START_RADIUS);
            $scope.drawArc(100, 'bgArc2', START_X, START_Y, (START_RADIUS + STROKE_WIDTH + 2));
            $scope.drawArc(100, 'bgArc3', START_X, START_Y, (START_RADIUS + STROKE_WIDTH * 2 + 4));

            // draw percentage arcs
            $scope.drawArc($scope.creditPercentage, 'creditArc', START_X, START_Y, START_RADIUS);
            $scope.drawArc($scope.stressPercentage, 'stressArc', START_X, START_Y, (START_RADIUS + STROKE_WIDTH + 2));
            $scope.drawArc($scope.healthPercentage,
             'healthArc', START_X, START_Y, (START_RADIUS + STROKE_WIDTH * 2 + 4));

            $scope.drawOverlayArc($scope.creditPercentage, 'overlayArc1', START_X, START_Y, START_RADIUS);
            $scope.drawOverlayArc($scope.stressPercentage,
             'overlayArc2', START_X, START_Y, (START_RADIUS + STROKE_WIDTH + 2));
            $scope.drawOverlayArc($scope.healthPercentage,
             'overlayArc3', START_X, START_Y, (START_RADIUS + STROKE_WIDTH * 2 + 4));
          };

          $scope.calculateCredit = function () {
            $scope.creditPercentage = (delta(CREDIT_MIN, $scope.credit) / delta(CREDIT_MIN, CREDIT_MAX)) * 100;

            if ($scope.creditPercentage > 100) {
              $scope.creditPercentage = 100;
            } else if ($scope.creditPercentage < 0) {
              $scope.creditPercentage = 0;
            }
          };

          $scope.calculateHealth = function () {
            switch ($scope.health) {
              case 'green':
                $scope.healthValue = 'Good';
                $scope.healthPercentage = 100;
                break;
              case 'orange':
                $scope.healthValue = 'Average';
                $scope.healthPercentage = 66;
                break;
              case 'red':
                $scope.healthValue = 'Poor';
                $scope.healthPercentage = 33;
                break;
            }
          };

          $scope.calculateStress = function () {
            $scope.stressPercentage = (delta(STRESS_MIN, $scope.stress) / delta(STRESS_MIN, STRESS_MAX)) * 100;

            if ($scope.stressPercentage > 100) {
              $scope.stressPercentage = 100;
            } else if ($scope.stressPercentage < 0) {
              $scope.stressPercentage = 0;
            }

            $scope.stress = Math.round($scope.stress);
          };

          $scope.drawArc = function (percent, id, x, y, radius) {
            var startAngle, endAngle, color, red, orange, green, path;

            // set up colors
            green = 'rgb(164, 213, 154)';
            red = 'rgb(224, 75, 80)';
            orange = 'rgb(231, 180, 108)';

            color = red;
            if (percent > 33) {
              color = orange;
            }
            if (percent > 66) {
              color = green;
            }

            percent *= 0.01;
            endAngle = percent * 360;

            startAngle = 0;

            path = document.getElementById(id);

            path.setAttribute('d', describeArc(x, y, radius, startAngle, endAngle));
            path.setAttribute('stroke-width', STROKE_WIDTH);

            if (path.classList.contains('colorize')) {
              path.setAttribute('stroke', color);
            }
          };

          // kind of annoying, but to get the gradient effect we need
          // to create an overlay stroke
          $scope.drawOverlayArc = function (percent, id, x, y, radius) {
            var startAngle, endAngle, path;

            if (percent > 80) {
              percent = 80;
            }

            percent *= 0.01;
            endAngle = percent * 360;
            startAngle = 0;

            path = document.getElementById(id);
            path.setAttribute('d', describeArc(x, y, radius, startAngle, endAngle));
            path.setAttribute('stroke-width', STROKE_WIDTH);
          };

          $scope.reloadArcs = function () {
            $scope.animateArc('creditArc');
            $scope.animateArc('stressArc');
            $scope.animateArc('healthArc');

            $scope.animateArc('overlayArc1');
            $scope.animateArc('overlayArc2');
            $scope.animateArc('overlayArc3');
          };

          delta = function (value1, value2) {
            d = value1 - value2;
            if (d < 0) {
              d *= -1;
            }
            return d;
          };

          describeArc = function (x, y, radius, startAngle, endAngle) {
            var start, end, arcSweep;

            if ((delta(startAngle, startAngle) === 0)) {
              endAngle--;
            }

            start = polarToCartesian(x, y, radius, endAngle);
            end = polarToCartesian(x, y, radius, startAngle);
            arcSweep = endAngle - startAngle <= 180 ? '0' : '1';

            d = [
                'M', start.x, start.y,
                'A', radius, radius, 0, arcSweep, 0, end.x, end.y
            ].join(' ');

            return d;
          }; // adapted from stackoverflow.com/questions/5736398/how-to-calculate-the-svg-path-for-an-arc-of-a-circle

          polarToCartesian = function (centerX, centerY, radius, angleInDegrees) {
            var angleInRadians = (angleInDegrees - 90) * Math.PI / 180.0;

            return {
              x: centerX + (radius * Math.cos(angleInRadians)),
              y: centerY + (radius * Math.sin(angleInRadians))
            };
          }; // stackoverflow.com/questions/5736398/how-to-calculate-the-svg-path-for-an-arc-of-a-circle
        },
        link: function (scope, elem, attrs) {
          // set an init value
          scope.labelShadow = false;

          var initGraph = function () {
            $timeout(function () {
              // calculate and animaate arcs
              scope.calculate();

              // add a drop shadow if the text sits over a bar
              if (scope.creditPercentage >= 75 || scope.stressPercentage >= 75 || scope.healthPercentage >= 75) {
                scope.labelShadow = true;
              } else {
                scope.labelShadow = false;
              }

              scope.$apply();
              scope.reloadArcs();
            });
          };

          attrs.$observe('health', initGraph);
          attrs.$observe('stress', initGraph);
          attrs.$observe('credit', initGraph);
        }
      };
    });
})();
