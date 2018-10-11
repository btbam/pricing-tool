/*global describe, beforeEach, it, expect, inject, module*/
'use strict';

describe('SignOutCtrl', function () {
  var ctrl, localToken, localUsername, $httpBackend, $rootScope;

  beforeEach(module('user'));
  beforeEach(module('satellizer'));

  beforeEach(inject(function (_$rootScope_, $controller, _$httpBackend_) {
    $rootScope = _$rootScope_;
    $httpBackend = _$httpBackend_;
    ctrl = $controller('SignOutCtrl');
  }));

  it('should have ctrlName as SignOutCtrl', function () {
    expect(ctrl.ctrlName).toEqual('SignOutCtrl');
  });

  it('should sign out the user', function () {

    sessionStorage.setItem('username','test');
    $httpBackend.expect('DELETE', 'http://127.0.0.1:3000/api/session')
      .respond({
        'email': 'test@pricing-tool.com',
        'token': 'tokenvalue'
      });
    $rootScope.$digest();

    var sessionUsername = sessionStorage.getItem('username');
    expect(sessionUsername).toEqual(null);
  });

});
