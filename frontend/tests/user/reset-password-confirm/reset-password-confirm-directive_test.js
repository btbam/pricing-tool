/*global describe, beforeEach, it, expect, inject, module*/
'use strict';

describe('resetPasswordConfirm', function () {
  var scope
    , element;

  beforeEach(module('user', 'user/reset-password-confirm/reset-password-confirm-directive.tpl.html'));
  beforeEach(module('satellizer'));

  beforeEach(inject(function ($compile, $rootScope) {
    scope = $rootScope.$new();
    element = $compile(angular.element('<reset-password-confirm></reset-password-confirm>'))(scope);
  }));

  it('should have correct text', function () {
    scope.$apply();
    expect(element.isolateScope().resetPasswordConfirm.name).toEqual('resetPasswordConfirm');
  });

  xit('should handle submit', function () {
    scope.$digest();
    element.isolateScope().submit();
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
});
