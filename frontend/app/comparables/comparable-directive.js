(function () {
  'use strict';

  angular.module('comparables')
    .directive('comparable', comparable);

  function comparable() {
    return {
      restrict: 'AE',
      scope: {
        section: '@',
        title: '@sectionTitle'
      },
      templateUrl: 'comparables/comparable-directive.tpl.html',
      bindToController: true,
      replace: false,
      controllerAs: 'comparable',
      controller: function ($scope, $stateParams, Comparables, SharedDataFactory) {
        var vm;
        vm = this;
        vm.characterWidth = 12;
        vm.graphData = {};
        vm.graphData.axis = [];
        vm.name = 'comparable';
        vm.s = $scope;
        vm.s.shared_data = SharedDataFactory;

        vm.adjustPercents = function () {
          var graph, i, j, len, maxPercent, ref, results, tickFactor, tickFactorAdjust, tickIncrement;

          maxPercent = Math.max.apply(null, vm.graphData.map(function (eachGraphData) {
            return eachGraphData.value;
          }));

          vm.graphData.axis = {
            ticks: [],
            pointWidth: 0,
            graphWidth: 375,
            graphTickAmount: 5
          };

          tickIncrement = 0.25;
          tickFactor = 0.25;
          tickFactorAdjust = 0.05;

          //2.5 is chosen because that is a maximum of 10 ticks

          if (maxPercent > 2.5) {
            tickIncrement = tickIncrement * Math.ceil(maxPercent);
          }

          maxPercent = Math.max(maxPercent + tickIncrement, 1);

          i = 0;
          while (i <= maxPercent) {
            vm.graphData.axis.ticks.push(Math.round(i * 100));
            i = i + tickIncrement;
          }

          vm.graphData.axis.pointWidth =
            vm.graphData.axis.graphWidth / (vm.graphData.axis.ticks.length - 1);
          maxPercent = i - tickIncrement;
          ref = vm.graphData;
          results = [];

          for (j = 0, len = ref.length; j < len; j++) {
            graph = ref[j];
            results.push(graph.percentMax = graph.value / maxPercent);
          }
          return results;
        };

        vm.changedItemSelected = function () {
          Comparables.getSingleSectionData($stateParams.duns_number, vm.section,
            vm.data.menu_select, vm.s.shared_data.loss_tab)
            .then(function (result) {
              vm.graphData[0].value = result.data[vm.section].loss_ratio;
              vm.graphData[0].title = result.data[vm.section].menu_select;
              vm.s.shared_data.menu_selects[vm.section] = vm.data.menu_select;
              vm.data = result.data[vm.section];
              return vm.adjustPercents();
            });
        };

        vm.getSectionsData = function () {
          Comparables.getSectionsData($stateParams.duns_number,
            vm.s.shared_data.menu_selects, vm.s.shared_data.loss_tab)
            .then(function (result) {
              vm.graphData = result.data[vm.section].graphData;
              vm.data = result.data[vm.section];
              return vm.adjustPercents();
            });
        };

        vm.setDno = function () {
          vm.s.shared_data.loss_tab = 'do';
        };

        vm.setEpli = function () {
          vm.s.shared_data.loss_tab = 'epli';
        };

        vm.s.$watch('shared_data.duns_number', function () {
          vm.s.shared_data.menu_selects = {};
        });

        vm.s.$watch('shared_data.loss_tab', function () {
          vm.getSectionsData();
        });

        vm.s.$watchGroup(['shared_data.employee_menu_select', 'shared_data.industry_name'], function () {
          vm.getSectionsData();
        }, true);

        return vm;
      }
    };
  }

})();
