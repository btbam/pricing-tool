/*global describe, beforeEach, it, expect, inject, module*/
'use strict';

describe('graphRadialFinancialHealth', function () {
  var scope
    , element;

  beforeEach(module('graphs', 'graphs/graph-radial-financial-health.tpl.html'));

  beforeEach(inject(function ($compile, $rootScope) {
    scope = $rootScope.$new();
    element = $compile(angular.element('<graph-radial-financial-health health="green" stress="1650" credit="570"></graph-radial-financial-health>'))(scope);
  }));

  // it('should have correct text', function () {
  //   scope.$digest();
  //   expect(element.scope().graphRadialFinancialHealth.name).toEqual('graphRadialFinancialHealth');
  // });

});
