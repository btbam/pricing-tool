/*global describe, beforeEach, it, expect, inject, module*/
'use strict';

describe('BasePremium', function () {
  var data, service, $httpBackend;

  beforeEach(module('calculator'));

  beforeEach(inject(function (BasePremium) {
    service = BasePremium;
  }));

  it('should calculate DO base premium', function () {
    describe('non-financial institution', function(){
      expect(service.getDO(0,1000000)).toEqual(4045);
      expect(service.getDO(0,2600000)).toEqual(4064);
      expect(service.getDO(0,2700000)).toEqual(4082.99981);
      expect(service.getDO(0,3000100)).toEqual(4140.01881);
      expect(service.getDO(0,3100000)).toEqual(4158.99981);
      expect(service.getDO(0,3100001)).toEqual(4159);

      expect(service.getDO(0,15999999)).toEqual(5466.999948);
      expect(service.getDO(0,16000000)).toEqual(5467);
      expect(service.getDO(0,16000001)).toEqual(5467);

      expect(service.getDO(0,50000000)).toEqual(6595);
      expect(service.getDO(0,51000000)).toEqual(6613.2);

      expect(service.getDO(0,54999999)).toEqual(6685.9999818);
      expect(service.getDO(0,55000000)).toEqual(6686);
      expect(service.getDO(0,55000001)).toEqual(6686);

      expect(service.getDO(0,56000000)).toEqual(6704.1999818);
      expect(service.getDO(0,26000000000)).toEqual(18343); // 26 billion
      expect(service.getDO(0,26000000001)).toEqual(18343); // 26 billion + 1
    })
  });

  it('should handle errors', function () {
    expect(service.getDO()).toEqual(0);
    expect(service.getDO(undefined)).toEqual(0);
    expect(service.getDO(null)).toEqual(0);
    expect(service.getDO('')).toEqual(0);
    expect(service.getDO('string with text')).toEqual(0);
  });

});
