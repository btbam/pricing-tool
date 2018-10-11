/*global describe, beforeEach, it, expect, inject, module*/
'use strict';

describe('LimitOfLiabilityRetention', function () {
  var service;

  beforeEach(module('calculator'));

  beforeEach(inject(function (LimitOfLiabilityRetention) {
    service = LimitOfLiabilityRetention;
  }));

  it('should equal Limit Of Liability Retention', function () {
    expect(service.get(250000, 5000)).toEqual(.75);
    expect(service.get(500000, 5000)).toEqual(.938);
    expect(service.get(250000, 25000)).toEqual(.6);
    expect(service.get(500000, 75000)).toEqual(.6);
    expect(service.get(50000000, 10000000)).toEqual(5.095);
  });

  it('should equal find the closest SIR', function () {
    expect(service.findClosestSIR(11000)).toEqual(10);
    expect(service.findClosestSIR(12000)).toEqual(10);
    expect(service.findClosestSIR(125000)).toEqual(100);
  });

  it('should catch errors when finding the closest SIR', function () {
    expect(service.findClosestLimit(null)).toEqual(250);
    expect(service.findClosestLimit(undefined)).toEqual(250);
    expect(service.findClosestLimit('N/A')).toEqual(250);
  });

  it('should equal find the closest limit', function () {
    expect(service.findClosestLimit(200000)).toEqual(250);
    expect(service.findClosestLimit(1500000)).toEqual(1000);
    expect(service.findClosestLimit(15000001)).toEqual(15000);
  });

  it('should catch errors when finding the closest limit', function () {
    expect(service.findClosestLimit(null)).toEqual(250);
    expect(service.findClosestLimit(undefined)).toEqual(250);
    expect(service.findClosestLimit('N/A')).toEqual(250);
  });

  it('should catch errors in getting Limit Of Liability Retention', function () {
    expect(service.get('test', 5000)).toEqual('N/A');
    expect(service.get(50000000000, 5000)).toEqual('N/A');
    expect(service.get(250000, 25000000000)).toEqual('N/A');
    expect(service.get(500000, 'test')).toEqual('N/A');
  });
});

describe('LimitOfLiabilityEpliRetention', function () {
  var service;

  beforeEach(module('calculator'));

  beforeEach(inject(function (LimitOfLiabilityEpliRetention) {
    service = LimitOfLiabilityEpliRetention;
  }));

  it('should equal Limit Of Liability Retention', function () {
    expect(service.get(500000, 5000)).toEqual(1.244);
    expect(service.get(1000000, 25000)).toEqual(1.197);
    expect(service.get(30000000, 75000)).toEqual(4.386);
    expect(service.get(50000000, 10000000)).toEqual(1.25);
  });

  it('should equal find the closest SIR', function () {
    expect(service.findClosestSIR(11000)).toEqual(10);
    expect(service.findClosestSIR(12000)).toEqual(10);
    expect(service.findClosestSIR(125000)).toEqual(100);
  });

  it('should catch errors when finding the closest SIR', function () {
    expect(service.findClosestLimit(null)).toEqual(500);
    expect(service.findClosestLimit(undefined)).toEqual(500);
    expect(service.findClosestLimit('N/A')).toEqual(500);
  });

  it('should equal find the closest limit', function () {
    expect(service.findClosestLimit(200000)).toEqual(500);
    expect(service.findClosestLimit(1500000)).toEqual(1000);
    expect(service.findClosestLimit(15000001)).toEqual(15000);
  });

  it('should catch errors when finding the closest limit', function () {
    expect(service.findClosestLimit(null)).toEqual(500);
    expect(service.findClosestLimit(undefined)).toEqual(500);
    expect(service.findClosestLimit('N/A')).toEqual(500);
  });

  it('should catch errors in getting Limit Of Liability Retention', function () {
    expect(service.get('test', 5000)).toEqual('N/A');
    expect(service.get(50000000000, 5000)).toEqual('N/A');
    expect(service.get(250000, 25000000000)).toEqual('N/A');
    expect(service.get(500000, 'test')).toEqual('N/A');
  });
});
