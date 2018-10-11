/*global describe, beforeEach, it, expect, inject, module*/
'use strict';

describe('graphSummaryBar', function () {
  var scope
    , element;

  beforeEach(module('graphs', 'graphs/graph-summary-bar-directive.tpl.html'));

  beforeEach(inject(function ($compile, $rootScope) {
    scope = $rootScope.$new();
    element = $compile(angular.element('<graph-summary-bar></graph-summary-bar>'))(scope);
  }));

  it('should have correct text', function () {
    scope.$apply();
    expect(element.scope().graphSummaryBar.name).toEqual('graphSummaryBar');
  });
});
