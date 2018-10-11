(function () {
  'use strict';

  angular.module('news')
  .directive('newsSearchGroup', function () {
    return {
      restrict:'E',
      scope:{keywords: '@', tabname: '@'},
      templateUrl:'news/news-search/news-search-group-directive.tpl.html',
      replace:false,
      controllerAs:'newsSearchGroupCtrl',
      controller: function ($rootScope, $scope) {
        var vm;
        vm = this;
        vm.name = 'newsSearchGroup';
        vm.s = $scope;
        vm.s.tabs = [{
          title: 'Web',
          keywords: ' ',
          active: true
        }, {
          title: 'News',
          keywords: '',
          active: false
        }, {
          title: 'Litigation',
          keywords: 'Litigation',
          active: false
        }, {
          title: 'M&A',
          keywords: 'Management and Acquisitions',
          active: false
        }, {
          title: 'Management',
          keywords: 'Management',
          active: false
        }];

        vm.s.selectTab = function (heading) {
          return vm.s.$broadcast('startSearch_' + heading);
        };
      }
    };
  }
);
})();
