/*global describe, beforeEach, it, expect, inject, module*/
'use strict';

describe('HeaderCtrl', function () {
  var ctrl;

  beforeEach(module('shared'));
  beforeEach(module('satellizer'));

  beforeEach(inject(function ($rootScope, $controller, $auth) {
    ctrl = $controller('HeaderCtrl');
  }));

  it('should have ctrlName as HeaderCtrl', function () {
    expect(ctrl.ctrlName).toEqual('HeaderCtrl');
  });

});
