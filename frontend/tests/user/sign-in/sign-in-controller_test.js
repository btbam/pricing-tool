/*global describe, beforeEach, it, expect, inject, module*/
'use strict';

describe('SignInCtrl', function () {
  var ctrl;

  beforeEach(module('pricing_tool_front'));

  beforeEach(inject(function ($rootScope, $controller) {
    ctrl = $controller('SignInCtrl');
  }));

  it('should have ctrlName as SignInCtrl', function () {
    expect(ctrl.ctrlName).toEqual('SignInCtrl');
  });

});
