/*global describe, beforeEach, it, expect, inject, module*/
'use strict';

describe('signUp', function () {
  var scope
    , element
    , $httpBackend;

  beforeEach(module('user', 'user/sign-up/sign-up-directive.tpl.html'));
  beforeEach(module('satellizer'));

  beforeEach(function(){
    module('shared', function($provide){
      $provide.value('$analytics', {
        event_track: function(eventName){}
      })
    })
  })

  beforeEach(inject(function ($compile, $rootScope, _$httpBackend_) {
    $httpBackend = _$httpBackend_;
    scope = $rootScope.$new();
    element = $compile(angular.element('<sign-up></sign-up>'))(scope);
    sessionStorage.removeItem('username');
  }));

  afterEach(function() {
    $httpBackend.verifyNoOutstandingExpectation();
    $httpBackend.verifyNoOutstandingRequest();
  });

  it('should have correct text', function () {
    scope.$digest();
    expect(element.isolateScope().signUp.name).toEqual('signUp');
  });

  it('should catch errors on submit', function () {
    var user = {
      email: 'test@test.com',
      password: 'inval',
      password_confirmation: 'hello'
    };
    scope.$digest();
    element.isolateScope().signUp.submit(user, {required:{}});
    expect(Object.keys(element.isolateScope().new_user.$error).length).toEqual(1);
  });

  it('should sign up and sign in', function () {
    $httpBackend.when('POST', 'http://127.0.0.1:3000/api/user')
      .respond({
          "email": "test@test.com",
          "token": "tokenvalue"
      });
    var user = {
      email: 'test@test.com',
      password: 'Test1234',
      password_confirmation: 'Test1234'
    };
    scope.$digest();
    var errors = {};
    element.isolateScope().signUp.submit(user, errors);
    $httpBackend.flush();
    expect(sessionStorage.getItem('username')).toBe(user.email);
  });

});
