/*global describe, beforeEach, it, expect, inject, module*/
'use strict';

describe('headerDirective', function () {
  var scope
    , element;

  beforeEach(module('shared', 'shared/header/header-directive-directive.tpl.html'));
  beforeEach(module('satellizer'));

  beforeEach(inject(function ($compile, $rootScope, $httpBackend, $auth) {
    scope = $rootScope.$new();
    element = $compile(angular.element('<header-directive></header-directive>'))(scope);
    $httpBackend.when('GET', 'http://127.0.0.1:3000/api/status/')
      .respond(null);
    $httpBackend.expectGET('http://127.0.0.1:3000/api/status/');
  }));

  it('should have correct text', function () {
    scope.$digest();
    expect(element.isolateScope().headerDirective.name).toEqual('headerDirective');
  });

});
