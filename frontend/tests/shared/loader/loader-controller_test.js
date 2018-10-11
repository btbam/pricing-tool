/*global describe, beforeEach, it, expect, inject, module*/
'use strict';

describe('LoaderCtrl', function () {
  var ctrl,
    $scope,
    vm;

  beforeEach(module('shared'));

  beforeEach(inject(function ($rootScope, $controller) {
    $scope = $rootScope;   // assign injected $rootScope to $scope
    ctrl = $controller('LoaderCtrl', { $scope: $scope });
  }));

  it('should have ctrlName as LoaderCtrl', function () {
    expect(ctrl.ctrlName).toEqual('LoaderCtrl');
  });

  it('should set loader', function () {
    expect(ctrl.ctrlName).toEqual('LoaderCtrl');
  });

});
