(function () {
  'use strict';

  angular.module('shared')
    .directive('headerDirective', function ($rootScope, Header) {
      return {
        restrict: 'AE',
        scope: {},
        templateUrl: 'shared/header/header-directive-directive.tpl.html',
        replace: false,
        controllerAs: 'headerDirective',
        controller: function () {
          var vm;
          vm = this;
          vm.name = 'headerDirective';
        },
        link: function (scope, element, attrs) {

          $rootScope.$watch('currentState', function (state) {
            scope.state = state;
          });

          /*jshint unused:false */
          $rootScope.$on('setHeaderData', function (response) {
            var user;
            user = Header.getUser();
            scope.user = user;
          });

          $rootScope.$broadcast('setHeaderData');
        }
      };
    });

})
.call(this);
