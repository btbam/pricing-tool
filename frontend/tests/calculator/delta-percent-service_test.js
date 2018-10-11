/*global describe, beforeEach, it, expect, inject, module*/
'use strict';

describe('DeltaPercent', function () {
  var service;

  beforeEach(module('calculator'));

  beforeEach(inject(function (DeltaPercent) {
    service = DeltaPercent;
  }));

  it('should calculate percent change', function () {
    expect(service.get(10,20)).toEqual({percent_change:'100%',percent_change_direction:'up'});
    expect(service.get(2345,2600)).toEqual({percent_change:'11%',percent_change_direction:'up'});
    expect(service.get(2345,260000)).toEqual({percent_change:'10987%',percent_change_direction:'up'});
  });

  it('should handle errors', function () {
    expect(service.get(null,null)).toEqual({percent_change:'',percent_change_direction:''});
    expect(service.get(0,2600)).toEqual({percent_change:'',percent_change_direction:''});
    expect(service.get(0,0)).toEqual({percent_change:'',percent_change_direction:''});
  });
});
