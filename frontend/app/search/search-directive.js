(function () {
  'use strict';

  angular.module('search')
    .directive('search', function ($http, $rootScope) {
      return {
        restrict: 'AE',
        scope: '=',
        templateUrl: function (elem, attrs) {
          return attrs.templateUrl || 'search/search-directive.tpl.html';
        },
        replace: false,
        controllerAs: 'search',
        controller: function ($analytics, $auth, $state, API_PATH, Search, User) {
          var vm;
          vm = this;
          vm.companies = [];
          vm.history = [];
          vm.historyVisible = false;
          vm.loadedHistory = false;
          vm.mainSearchActive = $state.is('search');
          vm.name = 'search';
          vm.navbarSearch = '';
          vm.predicate = 'duns_number';
          vm.reverse = false;
          vm.searchDone = false;
          vm.searchFrom = 0;
          vm.searchSize = 50;
          vm.searchTerm = '';
          vm.showAllSearch = false;

          vm.clearSearchInput = function () {
            vm.companies = [];
          };

          vm.clearTypeahead = function (e) {
            if (e.type === 'click') {
              angular.element('search input').val('');
            }
          };

          vm.formatLabel = function (val) {
            if (typeof val !== 'undefined' && val.name !== 'All Results' && val.name !== 'See All Results') {
              return val.name;
            } else {
              return vm.searchTerm;
            }
          };

          vm.getCompanySearch = function (val, type) {
            var handleSearchError, handleSearchSuccess, http_url;
            vm.isLoading = true;
            vm.updateSearchTerm(val);
            http_url = '';

            handleSearchError = function () {
              vm.isLoading = false;
            };

            handleSearchSuccess = function (response) {
              var companies;
              vm.companies = [];
              companies = [];
              response.data.companies.map(function (item) {
                companies.push(item);
              });
              if (companies.length === 0) {
                companies.push({
                  name: 'No results',
                  type: 'none'
                });
                $analytics.eventTrack('Search - No Results', {term: vm.searchTerm});
              } else {
                companies.push({
                  name: 'See All Results',
                  type: 'all'
                });
              }
              vm.isLoading = false;
              vm.companies = companies;
              return companies;
            };

            if (type === true) {
              http_url = API_PATH + '/api/entities/search/all.json';
            } else {
              http_url = API_PATH + '/api/entities/search.json';
            }

            return Search.get(http_url, {
                query: val
              }, 5000)
              .then(function (response) {
                $rootScope.$broadcast('closeFlashMessage');
                return handleSearchSuccess(response);
              }, function () {
                return handleSearchError();
              });
          };

          vm.goToCompanyPage = function (duns_number) {
            if (typeof $item !== 'undefined') {
              duns_number = $item.duns_number;
            }

            // Force history to be reloaded if user uses Back button from Entity View
            vm.historyVisible = false;
            vm.loadedHistory = false;
            vm.history = [];

            $state.go('entity', {
              duns_number: duns_number
            });
          };

          vm.hideHistory = function () {
            vm.historyVisible = false;
          };

          vm.onSelect = function ($item) {
            $rootScope.$broadcast('startLoader');
            $rootScope.$broadcast('closeFlashMessage');
            if (typeof $item.type !== 'undefined' && $item.type === 'all') {
              $analytics.eventTrack('Search - See All Results', {term: vm.searchTerm});
              $state.go('all-results', {
                search_term: vm.searchTerm
              });
            } else {
              vm.goToCompanyPage($item.duns_number);
            }
          };

          vm.removeHistory = function (duns_number) {
            User.deleteHistoryForDuns(duns_number)
              .success(function (response) {
                if (response.history) {
                  vm.history = response.history;
                }
              });
          };

          vm.selectHistory = function (duns_number) {
            $rootScope.$broadcast('startLoader');
            $rootScope.$broadcast('closeFlashMessage');
            vm.goToCompanyPage(duns_number);
          };

          vm.showHistory = function () {
            vm.isLoading = true;
            if (vm.loadedHistory) {
              vm.historyVisible = true;
              return;
            }
            User.getHistory()
              .success(function (response) {
                if (response.history) {
                  vm.history = response.history;
                  vm.historyVisible = true;
                  vm.isLoading = false;
                  vm.loadedHistory = true;
                }
              });
          };

          vm.showNavSearch = function () {
            if ($state.is('search') && !vm.showAllSearch) {
              return false;
            }

            if (!$auth.isAuthenticated()) {
              return false;
            } else {
              return true;
            }
          };

          vm.updateSearchTerm = function (searchTerm) {
            if ($state.is('all-results')) {
              $state.go('all-results', {
                search_term: vm.searchTerm
              });
              vm.isLoading = false;
            }

            if (searchTerm.length <= 2) {
              vm.isLoading = false;
            }

            vm.navbarSearch = searchTerm;
            vm.searchTerm = searchTerm;
          };

          $rootScope.$on('$stateChangeSuccess', function () {
            vm.mainSearchActive = $state.is('search');
          });

          return vm;
        }
      };
    });
})();
