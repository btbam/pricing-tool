(function () {
  'use strict';

  angular.module('graphs')
    .directive('graphSummaryBar', function () {
      return {
        restrict: 'E',
        replace: false,
        transclude: true,
        templateUrl: 'graphs/graph-summary-bar-directive.tpl.html',
        controllerAs: 'graphSummaryBar',
        controller: function () {
          var vm;
          vm = this;
          vm.name = 'graphSummaryBar';
        },
        link: function (scope, element, attrs) {
          return attrs.$observe('graphdata', function (dataStr) {
            var bar, barSpacing, barWidth, bar_container, dataset, dataset_update, graph, graphHeight, k, max,
              maxfinder, staggerAnimation, v, yScale;
            barWidth = attrs.barWidth;
            barSpacing = attrs.barSpacing;
            graphHeight = attrs.height;
            staggerAnimation = attrs.stagger === 'stagger';
            dataset = [];

            maxfinder = function (array, prop) {
              var values;
              values = array.map(function (el) {
                return el[prop];
              });
              return Math.max.apply(Math, values);
            };

            if (attrs.graphdata.length === 0) {
              return false;
            }

            $(element[0])
              .find('.bar-graph-container')
              .remove();

            graph = d3.select(element[0])
              .append('div')
              .attr('class', 'bar-graph-container')
              .append('div')
              .attr('class', 'bar-graph')
              .style('height', graphHeight + 'px');

            dataset = JSON.parse(attrs.graphdata);

            max = maxfinder(dataset, 'value');
            yScale = d3.scale.linear()
              .domain([0, max])
              .range([0, graphHeight]);

            bar_container = graph.selectAll('div')
              .data(dataset, function (d) {
                if (typeof d.title !== 'undefined') {
                  return d.title;
                } else if (typeof d.name !== 'undefined') {
                  return d.name;
                }
                return d.value;
              });

            bar_container.enter()
              .append('div')
              .attr('class', 'bar-container')
              .style('width', function () {
                return barWidth + 'px';
              })
              .style('left', function (d, i) {
                return (barWidth * i) + (barSpacing * i) + 'px';
              })
              .style('height', function () {
                return parseInt(yScale(max)) + 'px';
              });

            bar_container.exit()
              .remove();

            bar = bar_container.append('div')
              .style('width', function () {
                return barWidth + 'px';
              })
              .style('left', function () {
                return 0;
              })
              .attr('class', function (d, i) {
                return 'bar bar-' + i;
              })
              .style('height', function () {
                return '1px';
              });

            if ('display_value' in dataset[0] || 'value' in dataset[0]) {
              bar.append('span')
                .attr('class', 'bar-label')
                .text(function (d) {
                  if ('display_value' in d) {
                    return d.display_value;
                  } else {
                    return d.value;
                  }
                });
            }

            if ('title' in dataset[0]) {
              bar_container.append('span')
                .attr('class', 'bar-title')
                .text(function (d) {
                  return d.title;
                })
                .style('top', function () {
                  return parseInt(yScale(max), 10) + 15 + 'px';
                })
                .style('width', function () {
                  var w;
                  w = parseInt(barWidth, 10);
                  return w + w / 2 + 'px';
                })
                .style('margin-left', function () {
                  return Math.round(barWidth / 4) * (-1) + 'px';
                });
              dataset_update = JSON.parse(dataStr);
              if (dataset.length === 0) {
                dataset = dataset_update;
                for (k in dataset_update) {
                  v = dataset_update[k];
                  v.value = Number(v.value);
                }
              } else {
                for (k in dataset_update) {
                  v = dataset_update[k];
                  dataset[k].value = Number(v.value);
                  if (typeof v.display_value !== 'undefined') {
                    dataset[k].display_value = v.display_value;
                  }
                }
              }
            }

            return bar.transition()
              .duration(500)
              .delay(function (d, i) {
                if (staggerAnimation) {
                  return 500 + (100 * i);
                } else {
                  return 500;
                }
              })
              .style('height', function (d) {
                if (d.value <= 1) {
                  return '1px';
                } else {
                  return yScale(d.value) + 'px';
                }
              })
              .attr('class', function (d, i) {
                var colorClass;
                colorClass = '';
                if (d.range_colors) {
                  colorClass = colorClass + ' bar-colors ';
                  if (d.value > 97 && d.value < 106) {
                    colorClass = colorClass + ' bar-yellow';
                  } else if (d.value >= 106) {
                    colorClass = colorClass + ' bar-red';
                  } else {
                    colorClass = colorClass + ' bar-green';
                  }
                }
                return 'bar bar-' + i + ' ' + colorClass;
              })
              .select('.bar-label')
              .text(function (d) {
                if ('display_value' in d) {
                  return d.display_value;
                } else {
                  return d.value;
                }
              });
          });
        }
      };
    });
})();
