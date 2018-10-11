(function(angular) {
'use strict';

/**
 * @ngdoc overview
 * @name angulartics.heap
 * Enables analytics support for Heap (http://heapanalytics.com)
 */
angular.module('angulartics.heap', ['angulartics'])
.config(['$analyticsProvider', function ($analyticsProvider) {

  $analyticsProvider.registerSetUserProperties(function (properties) {
    heap.identify(properties);
  });
  
  $analyticsProvider.registerPageTrack(function (path) {
    heap.track('Page Viewed', { 'page': path } );
  });
  
  $analyticsProvider.registerEventTrack(function (action, properties) {
    heap.track(action, properties);
  });

}]);
})(angular);
