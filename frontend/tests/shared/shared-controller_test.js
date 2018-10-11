/*global describe, beforeEach, it, expect, inject, module*/
'use strict';

describe('SharedCtrl', function () {
  var ctrl;

  beforeEach(module('shared'));

  beforeEach(inject(function ($rootScope, $controller) {
    ctrl = $controller('SharedCtrl', {$scope:$rootScope.$new()});
  }));

  it('should have ctrlName as SharedCtrl', function () {
    expect(ctrl.ctrlName).toEqual('SharedCtrl');
  });

});
