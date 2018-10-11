/*global describe, beforeEach, it, expect, inject, module*/
'use strict';

describe('CalculatorCtrl', function () {
  var ctrl;

  beforeEach(module('calculator'));

  beforeEach(inject(function ($rootScope, $controller) {
    ctrl = $controller('CalculatorCtrl');
  }));

  it('should have ctrlName as CalculatorCtrl', function () {
    expect(ctrl.ctrlName).toEqual('CalculatorCtrl');
  });
});
