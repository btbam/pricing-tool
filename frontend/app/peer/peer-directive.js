(function () {
  'use strict';

  angular.module('peer')
    .directive('peer', function () {
      return {
        restrict: 'AE',
        scope: {},
        templateUrl: 'peer/peer-directive.tpl.html',
        replace: false,
        controllerAs: 'peer',
        controller: function ($rootScope, $scope, $stateParams, Peer, SharedDataFactory) {
          var vm;
          vm = this;
          vm.name = 'peer';
          vm.dno = true;
          vm.duns_number = $stateParams.duns_number;
          vm.epli = false;
          vm.result_counts = [10, 20, 30];
          vm.result_count_current = 10;
          vm.result_counts_visible = false;
          vm.rs = $rootScope;
          vm.s = $scope;
          vm.s.shared_data = SharedDataFactory;

          vm.changeResults = function (result_count) {
            vm.result_count_current = result_count;
          };

          vm.getData = function () {
            return Peer.getData(vm.duns_number, vm.s.shared_data.industry_sic).then(
              function (payload) {
                vm.responseData = payload;
                vm.s.shared_data.rate_need_data.group =
                  vm.responseData.data.peer_policies.dno_policies.peer_group.group_rate_need;
                if (vm.responseData.data.peer_policies.dno_policies.peer_group.current_policy) {
                  vm.s.shared_data.benchmark_data.gwp =
                  vm.responseData.data.peer_policies.dno_policies.peer_group.current_policy.gwp;
                } else {
                  vm.s.shared_data.benchmark_data.gwp = 0;
                }
                if (vm.responseData.data.peer_policies.epli_policies.peer_group.current_policy) {
                  vm.s.shared_data.epli_renewal = true;
                } else {
                  vm.s.shared_data.epli_renewal = false;
                }
              }
            );
          };

          vm.setDno = function () {
            vm.epli = false;
            vm.dno = true;
            vm.s.shared_data.rate_need_data.group =
              vm.responseData.data.peer_policies.dno_policies.peer_group.group_rate_need;
            if (vm.responseData.data.peer_policies.dno_policies.peer_group.current_policy) {
              vm.s.shared_data.benchmark_data.gwp =
              vm.responseData.data.peer_policies.dno_policies.peer_group.current_policy.gwp;
            } else {
              vm.s.shared_data.benchmark_data.gwp = 0;
            }
          };

          vm.setEpli = function () {
            vm.epli = true;
            vm.dno = false;
            vm.s.shared_data.rate_need_data.group =
              vm.responseData.data.peer_policies.epli_policies.peer_group.group_rate_need;
            if (vm.responseData.data.peer_policies.epli_policies.peer_group.current_policy) {
              vm.s.shared_data.benchmark_data.gwp =
              vm.responseData.data.peer_policies.epli_policies.peer_group.current_policy.gwp;
            } else {
              vm.s.shared_data.benchmark_data.gwp = 0;
            }
            if (vm.responseData.data.peer_policies.epli_policies.peer_group) {
              vm.s.shared_data.epli_renewal = true;
            } else {
              vm.s.shared_data.epli_renewal = false;
            }
          };

          vm.s.$watch('shared_data.industry_sic', function () {
            vm.getData();
          });

          return vm;
        }
      };
    });
})();
