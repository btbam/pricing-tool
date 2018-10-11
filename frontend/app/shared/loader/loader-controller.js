(function () {
  'use strict';

  angular.module('shared')
    .controller('LoaderCtrl', function ($rootScope, $scope, Loader) {
      var vm;
      vm = this;
      vm.ctrlName = 'LoaderCtrl';

      Loader.clear();
      $scope.isLoading = Loader.isLoading;

      $rootScope.$on('startLoader', function () {
        Loader.setLoading();
        $scope.isLoading = Loader.isLoading;
      });

      $rootScope.$on('stopLoader', function () {
        Loader.clear();
        $scope.isLoading = Loader.isLoading;
      });

      return vm;
    });
})();
