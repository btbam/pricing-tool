(function () {
  'use strict';

  angular.module('all-results')
    .directive('allResults', function ($rootScope) {
      return {
        restrict: 'AE',
        scope: '=',
        templateUrl: 'all-results/all-results-directive.tpl.html',
        replace: false,
        controllerAs: 'allResults',
        controller: function ($state, $stateParams, $timeout, API_PATH, Search) {
          var vm;
          vm = this;
          vm.customerOn = '';
          vm.name = 'allResults';
          vm.companies = [];
          vm.searchDone = false;
          vm.searchFrom = 0;
          vm.searchSize = 50;
          vm.searchTerm = $stateParams.search_term;
          vm.sortingBy = '';

          vm.broadCast = function () {
            $rootScope.$broadcast('startLoader');
            vm.params = {
              query: vm.searchTerm,
              from: vm.searchFrom,
              size: vm.searchSize
            };
          };

          vm.goToCompanyPage = function (duns_number) {
            if (typeof $item !== 'undefined') {
              duns_number = $item.duns_number;
            }
            $state.go('entity', {
              duns_number: duns_number
            });
          };

          vm.loadMore = function (val) {
            if (typeof val !== 'undefined') {
              vm.updateSearchTerm(val);
            }
            if (typeof vm.searchTerm === 'undefined' || vm.searchTerm === '') {
              return;
            }
            if (vm.searchDone) {
              return;
            }

            vm.broadCast();

            if (vm.sortingBy !== '') {
              vm.params.score_option = vm.sortingBy;
            }
            if (vm.customerOn !== '') {
              if (vm.customerOn === 'yes') {
                vm.params.customer = true;
              } else if (vm.customerOn === 'no') {
                vm.params.customer = false;
              }
            }

            vm.searchGet();
          };

          vm.reloadWithSorting = function () {
            vm.searchFrom = 0;
            vm.companies = [];
            return vm.loadMore();
          };

          vm.searchGet = function () {
            return Search.get(API_PATH + '/api/entities/search/all.json', vm.params, 5000)
              .then(function (response) {
                if (response.data.companies.length === 0) {
                  vm.searchDone = true;
                }
                response.data.companies.map(function (item) {
                  if (item.customer) {
                    item.customer = 'Yes';
                  } else {
                    item.customer = 'No';
                  }
                  if (!item.sales_volume) {
                    item.sales_volume = 'N/A';
                  }
                  vm.companies.push(item);
                });
                vm.searchFrom += 50;
                $rootScope.$broadcast('stopLoader');
              });
          };

          vm.sortBy = function (sortName) {
            if (vm.sortingBy === sortName) {
              vm.sortingBy = '';
            } else {
              vm.sortingBy = sortName;
            }
            return vm.reloadWithSorting();
          };

          vm.toggleCustomer = function () {
            if (vm.customerOn === 'yes') {
              vm.customerOn = 'no';
            } else if (vm.customerOn === 'no') {
              vm.customerOn = '';
            } else {
              vm.customerOn = 'yes';
            }
            return vm.reloadWithSorting();
          };

          vm.updateSearchTerm = function (searchTerm) {
            if (searchTerm.length <= 2) {
              vm.isLoading = false;
            }

            vm.navbarSearch = searchTerm;
            vm.searchTerm = searchTerm;
            Search.searchTerm = searchTerm;
            vm.searchDone = false;
            vm.searchFrom = 0;
            vm.companies = [];
          };

          $timeout(function () {
            vm.loadMore();
          });

          return vm;
        },
        link: function (scope) {
          var allResultsContainer;
          allResultsContainer = angular.element(document.getElementsByClassName('all-results-container'));
          return allResultsContainer.bind('scroll', function () {
            var scrollHeight;
            scrollHeight = allResultsContainer[0].scrollHeight - allResultsContainer.height();
            if (allResultsContainer.scrollTop() > (scrollHeight - 10)) {
              scope.$apply('allResults.loadMore()');
            }
          });
        }
      };
    });
})();
