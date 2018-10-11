/*global describe, beforeEach, it, expect, inject, module*/
'use strict';

describe('scrolly', function () {
  var scope
    , element;

  beforeEach(module('shared'));

  beforeEach(inject(function ($compile, $rootScope) {
    scope = $rootScope.$new();
    element = $compile(angular.element('<div scrolly scrolly-top="20" scrolly-bottom="30"></div>'))(scope);
  }));

  it('should use correct top margin input params', function () {
    scope.$apply();
    expect(element.attr('scrolly-top')).toEqual('20');
  });

  it('should use correct bottom margin input params', function () {
    scope.$apply();
    expect(element.attr('scrolly-bottom')).toEqual('30');
  });
});
