/*global describe, beforeEach, it, expect, inject, module*/
'use strict';

describe('signOut', function () {
  var scope
    , element;

  beforeEach(module('user', 'user/sign-out/sign-out-directive.tpl.html'));
  beforeEach(module('shared'));

  beforeEach(inject(function ($compile, $rootScope) {
    scope = $rootScope.$new();
    element = $compile(angular.element('<sign-out></sign-out>'))(scope);
  }));

  it('should have correct text', function () {
    scope.$digest();
    expect(element.isolateScope().signOut.name).toEqual('signOut');
  });

});
