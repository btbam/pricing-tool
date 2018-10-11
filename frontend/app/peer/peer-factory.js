(function () {
  'use strict';

  angular.module('peer')
    .factory('Peer', function ($http, API_PATH) {
      var rtnObj;
      rtnObj = {};

      rtnObj.getData = function (duns_number, sic_first) {
        return $http.get(API_PATH + '/api/entity/' + duns_number + '/peer_policies',
          {params: {sic: sic_first}})
          .success(function (response) {
            var vm = {};
            vm.dataLoaded = true;
            vm.dnoGroup = response.peer_policies.dno_policies.peer_group;
            vm.dnoCurrentPolicy = response.peer_policies.dno_policies.peer_group.current_policy;
            vm.dnoPolicies = response.peer_policies.dno_policies.peer_group.nearest_policies;

            vm.epliGroup = response.peer_policies.epli_policies.peer_group;
            vm.epliCurrentPolicy = response.peer_policies.epli_policies.peer_group.current_policy;
            vm.epliPolicies = response.peer_policies.epli_policies.peer_group.nearest_policies;
            return vm;
          })
          .error(function (response, status) {
            console.log('error response', response);
            return console.log('error status', status);
          });
      };

      return rtnObj;
    });
})();
