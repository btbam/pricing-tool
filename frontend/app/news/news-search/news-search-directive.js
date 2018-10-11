(function () {
  'use strict';

  angular.module('news')
    .directive('newsSearch', function (News) {
      return {
        restrict:'E',
        scope: {keywords:'@', tabname:'@', initialvalue: '@'},
        templateUrl: 'news/news-search/news-search-directive.tpl.html',
        replace: false,
        controllerAs: 'newsSearch',
        controller: function ($rootScope, $scope) {
          var vm;
          vm = this;
          vm.companyName = $rootScope.companyName;
          vm.firstTime = true;
          vm.name = 'newsSearch';
          vm.query = $rootScope.globalSearchTerm;
          vm.s = $scope;

          vm.range = function (n) {
            if (n) {
              return new Array(n);
            }
          };

          vm.search = function (search, start) {
            var companyNameEscaped;
            //  allintext forces the search to look for the complete phrase on the page
            companyNameEscaped = 'allintext\:\"' + vm.companyName + '\"';
            if (!search && (vm.companyName === undefined)) {
              return;
            } else if (!search) {
              search = companyNameEscaped;
            } else {
              search = search + ' ' + companyNameEscaped;
            }

            vm.loadingSearch = true;

            return News.search(search, start, $scope.keywords, $scope.tabname)
              .success(function (data) {
                vm.lastUpdate = Date;
                vm.results = data.results;
                vm.stats = data.stats;
                vm.pageRange = data.stats.pages;
                if (vm.stats.pages >= 10) {
                  vm.pageRange = 10;
                }
                vm.currentPage = start || 1;
                vm.loadingSearch = false;
              });
          };

          $scope.$on('startSearch_' + $scope.tabname, function () {
            if (vm.firstTime) {
              vm.search ();
              vm.firstTime = false;
            }
          });

          if ($scope.initialvalue === 'true') {
            vm.search ();
            vm.firstTime = false;
          }
        },
        link: function (scope) {
          scope.setActive = function (e) {
            angular.element('.page-active')
              .removeClass('page-active');
            angular.element(e.currentTarget)
              .addClass('page-active');
          };
        }
      };
    });
})();
