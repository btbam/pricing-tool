/*global describe, beforeEach, it, expect, inject, module*/
'use strict';

describe('ComparablesCtrl', function() {
  var $controller;
  var ctrl;
  var factory;
  var scope;

  beforeEach(module('comparables'))
  beforeEach(module('shared'))

  beforeEach(inject(function($rootScope, $controller) {
    ctrl = $controller('ComparablesCtrl', {
      $scope: $rootScope.$new(),
      comparablesSectionsData: {}
    });
  }));

  beforeEach(inject(function (Comparables) {
    factory = Comparables;
  }));

  it('should have ctrlName as ComparablesCtrl', function() {
    expect(ctrl.ctrlName).toEqual('ComparablesCtrl');
  });

})
