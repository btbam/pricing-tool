(function () {
  'use strict';

  angular.module('shared')
    .factory('Loader', function () {
      return {
        isLoading: true,
        clear: function () {
          this.isLoading = false;
        },
        setLoading: function () {
          this.isLoading = true;
        }
      };
    });
})();
