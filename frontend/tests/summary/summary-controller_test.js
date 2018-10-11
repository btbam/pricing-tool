/*global describe, beforeEach, it, expect, inject, module*/
'use strict';

describe('SummaryCtrl', function() {
  var ctrl;

  beforeEach(module('pricing_tool_front'));

  beforeEach(inject(function($rootScope, $controller) {
    ctrl = $controller('SummaryCtrl', {
      $scope: $rootScope.$new(),
      companyData: {
        data:{
          company: {
            employees: {
              company: {}
            },
            revenue: {
              company: {}
            }
          }
        }
      }
    });
  }));

  it('should have ctrlName as SummaryCtrl', function() {
    expect(ctrl.ctrlName).toEqual('SummaryCtrl');
  });

});
