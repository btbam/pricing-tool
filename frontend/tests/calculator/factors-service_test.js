/*global describe, beforeEach, it, expect, inject, module*/
'use strict';

describe('Factors', function () {
  var service;

  beforeEach(module('calculator'));

  beforeEach(inject(function (Factors) {
    service = Factors;
  }));

  it('should calculate years in operation factor', function () {
    expect(service.yearsInOperation(2)).toEqual({midpoint: 1.15, min: 1.05, max: 1.25});
    expect(service.yearsInOperation(3)).toEqual({midpoint: 1.03, min: 1, max: 1.05});
    expect(service.yearsInOperation(4)).toEqual({midpoint: 1.03, min: 1, max: 1.05});
    expect(service.yearsInOperation(5)).toEqual({midpoint: 1.03, min: 1, max: 1.05});
    expect(service.yearsInOperation(6)).toEqual({midpoint: 0.93, min: .85, max: 1});
  });

  it('should calculate years in operation epli factor', function () {
    expect(service.yearsInOperationEpli(2)).toEqual({midpoint: 1.15, min: 1.05, max: 1.25});
    expect(service.yearsInOperationEpli(3)).toEqual({midpoint: 1.025, min: 1, max: 1.05});
    expect(service.yearsInOperationEpli(4)).toEqual({midpoint: 1.025, min: 1, max: 1.05});
    expect(service.yearsInOperationEpli(5)).toEqual({midpoint: 1.025, min: 1, max: 1.05});
    expect(service.yearsInOperationEpli(6)).toEqual({midpoint: 0.925, min: .85, max: 1});
  });

  it('should adjust invalid factors', function () {
    expect(service.checkFactorErrors(1.7,0.5,1,1.5)).toEqual(1.5);
    expect(service.checkFactorErrors(.2,0.5,1,1.5)).toEqual(0.5);
    expect(service.checkFactorErrors(1.1,0.5,1,1.5)).toEqual(1.1);
    expect(service.checkFactorErrors('string',0.5,1,1.5)).toEqual(1);
    expect(service.checkFactorErrors('.',0.5,1,1.5)).toEqual(1);
    expect(service.checkFactorErrors('.8',0.5,1,1.5)).toEqual(0.8);
    expect(service.checkFactorErrors('1.8',0.5,1,1.5)).toEqual(1.5);
    expect(service.checkFactorErrors(null,0.5,1,1.5)).toEqual(1);
    expect(service.checkFactorErrors(undefined,0.5,1,1.5)).toEqual(1);
    expect(service.checkFactorErrors(NaN,0.5,1,1.5)).toEqual(1);
  });

  it('should calculate claims history factor', function () {
    expect(service.claimsHistory(3, 8)).toEqual(24);
  });

  it('should calculate specialty coverage factor', function () {
    expect(service.specialtyCoverage(2, 3)).toEqual(6);
  });


  it('should calculate financial condition factor', function () {
    expect(service.financialCondition(4,2,2,1)).toEqual(16);
  });

  it('should litigation factor', function () {
    expect(service.litigationFactor(4,2)).toEqual(8);
  });

  it('should calculate private company modifier factor', function () {
    expect(service.privateCompanyModifier(4,2,2,1,4,2,2,1)).toEqual(256);
  });

  it('should handle errors for claims history factor', function () {
    expect(service.multiplier(8)).toEqual(8);
    expect(service.multiplier('test', 'input')).toEqual('N/A');
    expect(service.multiplier('test')).toEqual('N/A');
    expect(service.multiplier(undefined, undefined)).toEqual('N/A');
    expect(service.multiplier(null, null)).toEqual('N/A');
    expect(service.multiplier(undefined, null)).toEqual('N/A');
    expect(service.multiplier(null, undefined)).toEqual('N/A');
  });


  describe('ratableEmployees', function() {
    it('should calculate ratable employees', function() {
      var caEmployees = {
        full: { union: 100, non_union: 60},
        part: { union: 100, non_union: 40}
      };
      expect(service.ratableEmployees(caEmployees, 'CA')).toEqual(180);

      var dcflmitxEmployees = {
        full: { union: 1000, non_union: 2100},
        part: { union: 2000, non_union: 1200}
      };
      expect(service.ratableEmployees(dcflmitxEmployees, 'DCFLMITX')).toEqual(4200);

      var otherEmployees = {
        full: { union: 1000, non_union: 2100, foreign: 100},
        part: { union: 2000, non_union: 1200, foreign: 500}
      };
      expect(service.ratableEmployees(otherEmployees, 'Other')).toEqual(4287.5);
    });

    it('should handle undefined input', function() {
      expect(service.ratableEmployees()).toEqual(0);
    });
  });

  describe('blendedBaseRate', function() {
    it('should calculate blended base rate factor', function() {
      expect(service.blendedBaseRate(180, 4200, 4287.5)).toEqual(1.181);
    });
  });
});
