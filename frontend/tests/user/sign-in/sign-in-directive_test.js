/*global describe, beforeEach, it, expect, inject, module*/
'use strict';

describe('signIn directive', function() {
  var scope, element, $httpBackend;

  beforeEach(module('angulartics'));
  beforeEach(module('angulartics.heap'));
  beforeEach(module('satellizer'));

  beforeEach(module('user', 'user/sign-in/sign-in-directive.tpl.html'));

  beforeEach(inject(function($compile, $rootScope, _$httpBackend_) {
    scope = $rootScope.$new();
    element = $compile(angular.element('<sign-in></sign-in>'))(scope);
    $httpBackend = _$httpBackend_;
  }));

  afterEach(function() {
    $httpBackend.verifyNoOutstandingExpectation();
    $httpBackend.verifyNoOutstandingRequest();
  });

  it('should have a ctrlName of signIn', function() {
    scope.$digest();
    expect(element.scope().signIn.name).toEqual('signIn');
  });

  it('should set sessionStorage items success', function() {
    scope.$digest();

    $httpBackend.when('POST', 'http://127.0.0.1:3000/api/session')
      .respond({
          "email": "test@pricing-tool.com",
          "token": "tokenvalue"
      });

    element.scope().user = {
      email: 'test@pricing-tool.com',
      password: 'password'
    };
    scope.$digest();
    element.scope().submit();
    $httpBackend.flush();

    var sessionUsername = sessionStorage.getItem('username');
    expect(sessionUsername).toBe('test@pricing-tool.com');
  });

  it('should have a message on failure', function() {
    scope.$digest();

    element.scope().user = {
      email: 'test',
      password: 'password'
    };

    $httpBackend.when('POST', 'http://127.0.0.1:3000/api/session')
      .respond(401, {
        error:'401 Unauthorized'
      });

    element.scope().user = {
      email: 'test@test.test',
      password: 'password'
    };
    scope.$digest();
    element.scope().submit();
    $httpBackend.flush();
    expect(element.scope().signIn.message).toBe('401 Unauthorized');
  });

  it('should update message on success', function() {
    scope.$digest();

    $httpBackend.when('POST', 'http://127.0.0.1:3000/api/session')
      .respond({
          "email": "test@pricing-tool.com",
          "token": "tokenvalue"
      });

    element.scope().user = {
      email: 'test@pricing-tool.com',
      password: 'password'
    };
    scope.$digest();
    element.scope().submit();
    $httpBackend.flush();
    expect(element.scope().signIn.message).toBe('success');
  });

});
