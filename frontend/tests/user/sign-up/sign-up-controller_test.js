/*global describe, beforeEach, it, expect, inject, module*/
'use strict';

describe('SignUpCtrl', function () {
  var ctrl;

  beforeEach(module('user'));
  beforeEach(module('shared'));

  beforeEach(inject(function ($rootScope, $controller) {
    ctrl = $controller('SignUpCtrl');
  }));

  it('should have ctrlName as SignUpCtrl', function () {
    expect(ctrl.ctrlName).toEqual('SignUpCtrl');
  });

});
