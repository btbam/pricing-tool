/*global describe, beforeEach, it, expect, inject, module*/
'use strict';

describe('stickTo', function () {
  var scope
    , element;

  beforeEach(module('shared'));

  beforeEach(inject(function ($compile, $rootScope) {
    scope = $rootScope.$new();
    element = $compile(angular.element('<div stick-to></div>'))(scope);
  }));

  it('should have stick-to as a param', function () {
    scope.$apply();
    expect(typeof element.attr('stick-to')).not.toEqual('undefined')
  });

});
