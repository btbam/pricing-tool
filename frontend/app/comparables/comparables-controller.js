(function () {
  'use strict';

  angular.module('comparables')
    .controller('ComparablesCtrl', ComparablesCtrl);

  function ComparablesCtrl(Comparables, $rootScope) {
    var vm;
    vm = this;
    vm.ctrlName = 'ComparablesCtrl';
    $rootScope.$broadcast('stopLoader');
    return vm;
  }

})();
