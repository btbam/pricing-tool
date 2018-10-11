/*global describe, beforeEach, it, expect, inject, module*/
'use strict';

describe('shortened', function () {
  beforeEach(module('shared'));

  it('should prepend a currency symbol to the results of the filter', inject(function($filter){
    expect($filter('shortened')(1500, '$')).toContain('$');
  }));

  it('should prepend a currency symbol and append a suffix to the results of the filter', inject(function($filter){
    expect($filter('shortened')(1500, '$')).toContain('$');
    expect($filter('shortened')(1500, '$')).toContain('k');
  }));

  it('should NOT prepend a currency symbol to the results of the filter', inject(function($filter){
    expect($filter('shortened')(1500)).toBe('1.5k');
  }));

  describe('with suffix and no currency', function(){
    it('should shorten large numbers and append a prefix symbol', inject(function($filter){
      expect($filter('shortened')(500)).toEqual('500');
    }));

    it('should shorten large numbers and append a prefix symbol', inject(function($filter){
      expect($filter('shortened')(5000)).toEqual('5k');
    }));

    it('should shorten large numbers and append a prefix symbol', inject(function($filter){
      expect($filter('shortened')(500000)).toEqual('500k');
    }));

    it('should handle rounding to 2 decimals', inject(function($filter){
      expect($filter('shortened')(1555555)).toEqual('1.56M');
    }));

    it('should shorten large numbers and append a prefix symbol', inject(function($filter){
      expect($filter('shortened')(100000000)).toEqual('100M');
    }));

    it('should shorten large numbers and append a prefix symbol', inject(function($filter){
      expect($filter('shortened')(1000000000)).toEqual('1B');
    }));

    it('should shorten large numbers and append a prefix symbol', inject(function($filter){
      expect($filter('shortened')(1000000000000)).toEqual('1T');
    }));

    it('should shorten large numbers and append a prefix symbol', inject(function($filter){
      expect($filter('shortened')(1000000000000000)).toEqual('1000T');
    }));

    it('should shorten large numbers and append a prefix symbol', inject(function($filter){
      expect($filter('shortened')(100000000000000000)).toEqual('100000T');
    }));
  });

  describe('with suffix and currency', function(){
    it('should shorten large numbers and append a prefix symbol', inject(function($filter){
      expect($filter('shortened')(500, '$')).toEqual('$500');
    }));

    it('should shorten large numbers and append a prefix symbol', inject(function($filter){
      expect($filter('shortened')(5000, '$')).toEqual('$5k');
    }));

    it('should shorten large numbers and append a prefix symbol', inject(function($filter){
      expect($filter('shortened')(500000, '$')).toEqual('$500k');
    }));

    it('should handle rounding to 2 decimals', inject(function($filter){
      expect($filter('shortened')(1555555, '$')).toEqual('$1.56M');
    }));

    it('should shorten large numbers and append a prefix symbol', inject(function($filter){
      expect($filter('shortened')(100000000, '$')).toEqual('$100M');
    }));

    it('should shorten large numbers and append a prefix symbol', inject(function($filter){
      expect($filter('shortened')(1000000000, '$')).toEqual('$1B');
    }));

    it('should shorten large numbers and append a prefix symbol', inject(function($filter){
      expect($filter('shortened')(1000000000000, '$')).toEqual('$1T');
    }));

    it('should shorten large numbers and append a prefix symbol', inject(function($filter){
      expect($filter('shortened')(1000000000000000, '$')).toEqual('$1000T');
    }));

    it('should shorten large numbers and append a prefix symbol', inject(function($filter){
      expect($filter('shortened')(100000000000000000, '$')).toEqual('$100000T');
    }));
  });

  describe('without suffix', function(){
    it('should shorten large numbers and omit appending a suffix symbol', inject(function($filter){
      expect($filter('shortened')(100000000, '', false)).toEqual('100');
    }));
    it('should shorten large numbers and omit appending a suffix symbol', inject(function($filter){
      expect($filter('shortened')(100000000, '$', false)).toEqual('$100');
    }));

  });

  describe('with suffix and forced scale', function(){
    it('should shorten large numbers and omit appending a suffix symbol', inject(function($filter){
      expect($filter('shortened')(100, '$', true, 'k')).toEqual('$0.1k');
      expect($filter('shortened')(100000, '$', true, 'M')).toEqual('$0.1M');
      expect($filter('shortened')(100000000, '$', true, 'B')).toEqual('$0.1B');
      expect($filter('shortened')(100000000000, '$', true, 'T')).toEqual('$0.1T');
      expect($filter('shortened')(100000000000, '$', true, 'B')).toEqual('$100B');
      expect($filter('shortened')(1000000000000, '$', true, 'B')).toEqual('$1000B');
    }));

  });

  describe('not number cases', function(){
    it('should handle cases of "N/A"', inject(function($filter){
      expect($filter('shortened')("N/A")).toEqual('N/A');
    }));

    it('should handle cases of null', inject(function($filter){
      expect($filter('shortened')(null)).toEqual('N/A');
    }));

    it('should handle cases of undefined', inject(function($filter){
      expect($filter('shortened')(undefined)).toEqual('N/A');
    }));

    it('should handle cases of NaN', inject(function($filter){
      expect($filter('shortened')(NaN)).toEqual('N/A');
    }));

    it('should handle cases of incorrectly formatted strings', inject(function($filter){
      expect($filter('shortened')("thirty-seven")).toEqual('N/A');
    }));
  });

});
