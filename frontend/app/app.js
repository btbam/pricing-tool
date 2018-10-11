(function () {
  'use strict';

  detectIe();

  /* @ngdoc object
   * @name pricing_tool_front
   * @requires $urlRouterProvider
   *
   * @description
   *
   */
  angular
    .module('pricing_tool_front', [
      'ui.bootstrap',
      'ngAria',
      'ngMessages',
      'ui.router',
      'ngPassword',
      'satellizer',
      'ngIdle',
      'shared',
      'shared.environment',
      'comparables',
      'companyInfo',
      'companyOverview',
      'news',
      'summary',
      'search',
      'all-results',
      'graphs',
      'user',
      'angulartics',
      'portfolio',
      'angulartics.heap',
      'fcsa-number',
      'errorHandler',
      'toastr',
      'angular-capitalize-filter',
      'tableSort',
      'calculator',
      'entity',
      'peer',
      'spEntity'
    ]);

  angular
    .module('pricing_tool_front')
    .config(config)
    .run(function ($rootScope, $state, $window, toastr, Status, ENV, HEAP_ID, $auth, Title) {
      $rootScope.$auth = $auth;

      // Heap Analytics
      /* jshint ignore:start */
      //jscs:disable
      window.heap=window.heap||[],heap.load=function(t,e){window.heap.appid=t,window.heap.config=e;var a=document.createElement("script");a.type="text/javascript",a.async=!0,a.src=("https:"===document.location.protocol?"https:":"http:")+"//cdn.heapanalytics.com/js/heap-"+t+".js";var n=document.getElementsByTagName("script")[0];n.parentNode.insertBefore(a,n);for(var o=function(t){return function(){heap.push([t].concat(Array.prototype.slice.call(arguments,0)))}},p=["clearEventProperties","identify","setEventProperties","track","unsetEventProperty"],c=0;c<p.length;c++)heap[p[c]]=o(p[c])};
      heap.load(HEAP_ID);
      //jscs:enable
      /* jshint ignore:end */

      Title.timedOutMessage('pricing-tool');

      $rootScope.$on('IdleTimeout', function () {
        $state.go('signOut');
      });

      $rootScope.$on('$stateChangeSuccess',
        function (event, toState, toParams) {
          $rootScope.$broadcast('startLoader');

          // possibly refactor this into its own module/service
          // if there are more pages it can quickly become unmanageable
          // and should be handled on a page by page basis instead of
          // catching them all here
          if (toState.name === 'search' || toState.name === 'entity') {
            if (!$rootScope.$auth.isAuthenticated()) {
              $rootScope.$broadcast('setHeaderData');
              $state.go('signIn');
            }
          }

          $rootScope.myParams = toParams;
          $rootScope.currentState = toState.name;

          if (toState.url.indexOf('entity') > -1) {
            $rootScope.isEntity = true;
          } else {
            $rootScope.isEntity = false;
          }
        });

      $rootScope.$on('flashMessage', function (event, data) {
        if (data.hasOwnProperty('type') && data.type === 'warning') {
          toastr.warning(data.message);
        } else if (data.hasOwnProperty('type') && data.type === 'error') {
          toastr.error(data.message);
        } else {
          if (data.message !== '401 Unauthorized') {
            toastr.info(data.message);
          } else {
            toastr.info('Session expired');
            $state.go('signIn');
          }
        }
      });

      $rootScope.$on('closeFlashMessage', function () {
        toastr.clear();
      });

      Status.currentStatus()
        .then(function (data) {
          if (typeof data === 'undefined' || data === false || data === null) {
            return false;
          } else if (data.hasOwnProperty('message')) {
            $rootScope.$broadcast('flashMessage', {
              message: data.message,
              type: 'info'
            });
          }
          return;
        });

      $rootScope.shouldTrack = true;
    });

  function config($urlRouterProvider, $httpProvider, $analyticsProvider, $compileProvider, ENV, API_PATH,
    $authProvider, IdleProvider) {

    IdleProvider.idle(1800); // in seconds
    IdleProvider.timeout(1); // in seconds

    $authProvider.baseUrl = API_PATH;
    $authProvider.loginUrl = '/api/session';
    $authProvider.loginRoute = '/signin';
    $authProvider.loginRedirect = '/';
    $authProvider.signupRedirect = '/search';
    $authProvider.signupUrl = '/api/user';
    $authProvider.signupRoute = '/signup';
    $authProvider.storage = 'sessionStorage';

    $httpProvider.defaults.cache = true;
    $urlRouterProvider.otherwise(function ($injector, $location) {
      if (!$location.$$search.sp_token && !$location.$$search.password) {
        return '/search';
      }
    });

    $analyticsProvider.virtualPageviews(true);

    $httpProvider.interceptors.push('responseInterceptor');
    $compileProvider.debugInfoEnabled(false);
  }

  function detectIe() {
    /* jshint ignore:start */
    function msieversion() {

      var ua, msie, ver;

      ua = window.navigator.userAgent;
      msie = ua.indexOf('MSIE ');

      if (msie > 0 || !!navigator.userAgent.match(/Trident.*rv\:11\./)) { // If Internet Explorer, return version number
        //ver =  parseInt(ua.substring(msie + 5, ua.indexOf('.', msie)));
        return true;
      }
      return false;
    }

    if (msieversion() === true) {
      window.location.href = '/upgrade/';
    }
    /* jshint ignore:end */
  }

})();
