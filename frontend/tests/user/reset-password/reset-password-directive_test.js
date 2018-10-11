/*global describe, beforeEach, it, expect, inject, module*/
'use strict';

describe('resetPassword', function () {
  var scope
    , element
    , $httpBackend;

  beforeEach(module('user', 'user/reset-password/reset-password-directive.tpl.html'));
  beforeEach(module('shared'));

  beforeEach(inject(function ($compile, $rootScope, _$httpBackend_) {
    scope = $rootScope.$new();
    $httpBackend = _$httpBackend_;
    element = $compile(angular.element('<reset-password></reset-password>'))(scope);

  }));

  it('should have correct text', function () {
    scope.$digest();
    expect(element.isolateScope().resetPassword.name).toEqual('resetPassword');
  });

  xit('should handle submit', function () {
    scope.$digest();
    var user = {
      email: 'test@test.com'
    }
    $httpBackend.expectPOST('http://127.0.0.1:3000/api/user/password/reset_token', {user:user})
      .respond(200, {data:'hi'});
    $httpBackend.whenPOST('http://127.0.0.1:3000/api/user/password/reset_token')

    var error = {};
    console.log(element.isolateScope().submit(user, error));
    scope.$digest();

    expect(true).toEqual(false);
  });

  it('should handle errors on submit', function () {
    scope.$digest();
    var user = {
      email: 'test@test.com'
    }
    var error = [{required:true}];
    expect(element.isolateScope().submit(user, error)).toEqual(false);
  });

  xit('should submit', function () {
    scope.$digest();
    var user = {
      email: 'test@test.com'
    }
    var error = [];
    expect(element.isolateScope().submit(user, error)).toEqual(false);
  });

});
