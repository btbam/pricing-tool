/*global describe, beforeEach, it, expect, inject, module*/
'use strict';

describe('User', function() {
  var factory, $httpBackend, $auth;

  beforeEach(module('shared'));
  beforeEach(module('user'));
  beforeEach(module('satellizer'));

  beforeEach(inject(function(User, _$httpBackend_, _$auth_) {
    $auth = _$auth_;
    factory = User;
    $httpBackend = _$httpBackend_

  }));

  afterEach(function() {
    $httpBackend.verifyNoOutstandingExpectation();
    $httpBackend.verifyNoOutstandingRequest();
  });

  xit('should have signUp() defined', function() {
    expect(factory.signUp()).toBeDefined();
  });

  it('should login the user', function() {
    $httpBackend.when('POST', 'http://127.0.0.1:3000/api/session')
      .respond({
        'email': 'test@pricing-tool.com',
        'token': 'tokenvalue'
      });

    var userdata = {
      user: {
        email: 'test',
        password: 'test'
      }
    }
    var response = $auth.login(userdata);
    $httpBackend.flush();
    expect(response.$$state.value.data.email).toBe('test@pricing-tool.com');
    expect(response.$$state.value.data.token).toBe('tokenvalue');
  });

});
