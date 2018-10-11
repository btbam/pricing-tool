/*global describe, beforeEach, it, expect, inject, module*/
'use strict';

describe('AllResultsCtrl', function() {
  var ctrl;

  beforeEach(module('pricing_tool_front'));

  beforeEach(inject(function($rootScope, $controller) {
    ctrl = $controller('AllResultsCtrl', {
      $scope: $rootScope.$new()
    });
  }));

  it('should have ctrlName as AllResultsCtrl', function() {
    expect(ctrl.ctrlName).toEqual('AllResultsCtrl');
  });

});
