/*global describe, beforeEach, it, expect, inject, module*/
'use strict';

describe('ResetPasswordConfirmCtrl', function () {
  var ctrl;

  beforeEach(module('user'));

  beforeEach(inject(function ($rootScope, $controller) {
    ctrl = $controller('ResetPasswordConfirmCtrl');
  }));

  it('should have ctrlName as ResetPasswordConfirmCtrl', function () {
    expect(ctrl.ctrlName).toEqual('ResetPasswordConfirmCtrl');
  });
});
