/*global describe, beforeEach, it, expect, inject, module*/
'use strict';

describe('graphFinancialStressBar', function () {
  var scope
    , element;

  beforeEach(module('graphs', 'graphs/graph-financial-stress-bar-directive.tpl.html'));

  beforeEach(inject(function ($compile, $rootScope) {
    scope = $rootScope.$new();
    element = $compile(angular.element('<graph-financial-stress-bar></graph-financial-stress-bar>'))(scope);
  }));

  it('should have correct text', function () {
    scope.$apply();
    expect(element.scope().graphFinancialStressBar.name).toEqual('graphFinancialStressBar');
  });

  it('should have correct text', function () {
    scope.$apply();

    expect(scope.colorBasedOnValue(1700)).toEqual('arrow-green');
    expect(scope.colorBasedOnValue(1600)).toEqual('arrow-yellow-light');
    expect(scope.colorBasedOnValue(1500)).toEqual('arrow-yellow');
    expect(scope.colorBasedOnValue(1400)).toEqual('arrow-yellow');
    expect(scope.colorBasedOnValue(1300)).toEqual('arrow-orange');
    expect(scope.colorBasedOnValue(1200)).toEqual('arrow-orange');
    expect(scope.colorBasedOnValue(1100)).toEqual('arrow-red');
  });
});
