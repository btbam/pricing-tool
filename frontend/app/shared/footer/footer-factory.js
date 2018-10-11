(function () {
  'use strict';

  angular.module('shared')
    .factory('Footer', function ($auth) {
      var FooterBase;
      FooterBase = {};

      FooterBase.getUser = function () {
        var user;
        user = {};

        if ($auth.isAuthenticated() && localStorage.getItem('remember')) {
          user.email = localStorage.getItem('username');
        } else if ($auth.isAuthenticated()) {
          user.email = sessionStorage.getItem('username');
        }

        return user;
      };

      return FooterBase;
    });

})();
