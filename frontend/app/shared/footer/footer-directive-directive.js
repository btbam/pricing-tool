(function () {
  'use strict';

  angular.module('shared')
    .directive('footerDirective', function ($rootScope, Footer) {
      return {
        restrict: 'AE',
        scope: {},
        templateUrl: 'shared/footer/footer-directive-directive.tpl.html',
        replace: false,
        controllerAs: 'footerDirective',
        controller: function () {
          var vm;
          vm = this;
          vm.name = 'footerDirective';
        },
        link: function (scope, element, attrs) {

          $rootScope.$watch('currentState', function (state) {
            scope.state = state;
          });

          /*jshint unused:false */
          $rootScope.$on('setHeaderData', function (response) {
            var user;
            user = Footer.getUser();
            scope.user = user;
          });

          $rootScope.$broadcast('setHeaderData');
        }
      };
    });

})
.call(this);
