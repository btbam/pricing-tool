/*global describe, beforeEach, it, expect, inject, module*/
'use strict';

describe('SearchCtrl', function() {
  var ctrl;

  beforeEach(module('pricing_tool_front'));


  beforeEach(inject(function($rootScope, $controller) {
    ctrl = $controller('SearchCtrl', {
      $scope: $rootScope.$new()
    });
  }));

  it('should have ctrlName as SearchCtrl', function() {
    expect(ctrl.ctrlName).toEqual('SearchCtrl');
  });

});
