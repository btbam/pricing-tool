/*global describe, beforeEach, it, expect, inject, module*/
'use strict';

describe('FooterCtrl', function () {
  var ctrl;

  beforeEach(module('shared'));

  beforeEach(inject(function ($rootScope, $controller) {
    ctrl = $controller('FooterCtrl');
  }));

  it('should have ctrlName as FooterCtrl', function () {
    expect(ctrl.ctrlName).toEqual('FooterCtrl');
  });
});
