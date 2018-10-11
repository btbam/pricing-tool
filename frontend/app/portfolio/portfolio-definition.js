(function () {
  'use strict';

  angular.module('portfolio').directive(
    'donutChart', function () {
      return {
        restrict: 'E',
        scope: {
          data:'=',
          dimensions:'='
        },
        link: function (scope, element) {
          var arc, color, domains, height, key, midAngle, oldAngle,
          outerArc, pie, radius, randomData, svg, updateChart, width;
          height = 180;
          radius = 60;
          width = 410;

          key = function (d) {
            return d.data.label;
          };

          midAngle = function (d) {
            return d.startAngle + (d.endAngle - d.startAngle) / 2;
          };

          //this is used to create random mapped data
          randomData = function () {
            var labels = color.domain();
            return labels.map(
              function (label) {
                return {label: label, value: Math.random()};
              }
            );
          };

          updateChart = function (data) {
            var polyline, slice, textDraw;
            slice = svg.select('.slices').selectAll('path.slice')
              .data(pie(data), key);

            slice.enter()
              .insert('path')
              .style(
              'fill', function (d) {
                return color(d.data.label);
              }
            )
              .attr('class', 'slice');

            slice
              .transition().duration(0)
              .attrTween(
              'd', function (d) {
                oldAngle = oldAngle || d;
                var interpolate = d3.interpolate(oldAngle, d);
                oldAngle = interpolate(0);
                return function (t) {
                  return arc(interpolate(t));
                };
              }
            );
            slice.exit()
              .remove();
            textDraw = svg.select('.labels').selectAll('text')
              .data(pie(data), key);

            textDraw.enter()
              .append('text')
              .attr('dy', '.35em').
              style('font-size', '20px').
              style('fill', '#999999')//must overload font here, perhaps later take from css class
              .text(
              function (d) {
                return d.data.label;
              }
            );

            textDraw.transition().duration(0)
              .attrTween(
              'transform', function (d) {
                oldAngle = oldAngle || d;
                var interpolate = d3.interpolate(oldAngle, d);
                oldAngle = interpolate(0);
                return function (t) {
                  var d2, pos;
                  d2 = interpolate(t);
                  pos = outerArc.centroid(d2);
                  pos[0] = radius * (midAngle(d2) < Math.PI ? 1 : -1);
                  return 'translate(' + pos + ')';
                };
              }
            )
              .styleTween(
              'text-anchor', function (d) {
                oldAngle = oldAngle || d;
                var interpolate = d3.interpolate(oldAngle, d);
                oldAngle = interpolate(0);
                return function (t) {
                  var d2 = interpolate(t);
                  return midAngle(d2) < Math.PI ? 'start' : 'end';
                };
              }
            );

            textDraw.exit()
              .remove();

            polyline = svg.select('.lines').selectAll('polyline')
              .data(pie(data), key);

            polyline.enter()
              .append('polyline');

            polyline.transition().duration(0)
              .attrTween(
              'points', function (d) {
                oldAngle = oldAngle || d;
                var interpolate = d3.interpolate(oldAngle, d);
                oldAngle = interpolate(0);
                return function (t) {
                  var d2, pos;
                  d2 = interpolate(t);
                  pos = outerArc.centroid(d2);
                  pos[0] = radius * 0.95 * (midAngle(d2) < Math.PI ? 1 : -1);
                  return [arc.centroid(d2), outerArc.centroid(d2), pos];
                };
              }
            );

            polyline.exit()
              .remove();
          };

          domains = _.map(
            scope.data, function (index) {
              return index.name;
            }
          );

          svg = d3.select(element[0])
            .append('svg')
            .attr('width', width)
            .attr('height', height)
            .append('g');

          svg.append('g')
            .attr('class', 'slices');
          svg.append('g')
            .attr('class', 'labels ');
          svg.append('g')
            .attr('class', 'lines');

          pie = d3.layout.pie()
            .sort(null)
            .value(
            function (d) {
              return d.value;
            }
          );

          arc = d3.svg.arc()
            .outerRadius(radius * 1.0)
            .innerRadius(radius * 0.44);

          outerArc = d3.svg.arc()
            .innerRadius(radius * 0.80)
            .outerRadius(radius * 0.80);

          svg.attr('transform', 'translate(' + width / 2 + ',' + height / 2 + ')');

          //the color table, export me later
          color = d3.scale.ordinal()
            .domain(domains)
            .range(['#8fcc96', '#e6a15c', '#f07e66']);

          //just generate noise
          updateChart(randomData());
        }
      };
    }
  );
})();
