/*global describe, beforeEach, it, expect, inject, module*/
'use strict';

describe('companyScroller', function () {
  var scope
    , element;

  beforeEach(module('shared'));

  beforeEach(inject(function ($compile, $rootScope) {
    scope = $rootScope.$new();
    element = $compile(angular.element('<company-scroller></company-scroller>'))(scope);
  }));

  xit('should have correct text', function () {
    scope.$digest();
    //TODO: find a way to test this
  });

});
