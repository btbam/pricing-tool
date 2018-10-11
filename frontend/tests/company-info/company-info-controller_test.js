/*global describe, beforeEach, it, expect, inject, module*/
'use strict';

describe('CompanyInfoCtrl', function () {
  var ctrl;

  beforeEach(module('shared'));
  beforeEach(module('companyInfo'));

  beforeEach(inject(function ($rootScope, $controller) {
    ctrl = $controller('CompanyInfoCtrl', {
      $scope: $rootScope.$new()
    });
  }));

  it('should have ctrlName as CompanyInfoCtrl', function () {
    expect(ctrl.ctrlName).toEqual('CompanyInfoCtrl');
  });

});
