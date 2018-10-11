/*global describe, beforeEach, it, expect, inject, module*/
'use strict';

describe('EntityCtrl', function () {
  var ctrl;

  beforeEach(module('satellizer'));
  beforeEach(module('entity'));
  beforeEach(module('ngIdle'));

  beforeEach(inject(function ($rootScope, $controller) {
    ctrl = $controller('EntityCtrl');
  }));

  it('should have ctrlName as EntityCtrl', function () {
    expect(ctrl.ctrlName).toEqual('EntityCtrl');
  });
});
