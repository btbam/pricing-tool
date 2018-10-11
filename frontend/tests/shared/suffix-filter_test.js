/*global describe, beforeEach, it, expect, inject, module*/
'use strict';

describe('suffix', function () {
  beforeEach(module('shared'));

  it('should return M for 100', inject(function ($filter) {
    expect($filter('suffix')(100)).toEqual('');
  }));

  it('should return M for 1000000', inject(function ($filter) {
    expect($filter('suffix')(1000000)).toEqual('M');
  }));

  it('should return B', inject(function ($filter) {
    expect($filter('suffix')(1000000000)).toEqual('B');
  }));

  it('should return T', inject(function ($filter) {
    expect($filter('suffix')(1000000000000)).toEqual('T');
  }));

  it('should return T', inject(function ($filter) {
    expect($filter('suffix')(1000000000000000)).toEqual('T');
  }));

  describe('not number cases', function(){
    it('should handle cases of null', inject(function($filter){
      expect($filter('suffix')(null)).toEqual('');
    }));

    it('should handle cases of undefined', inject(function($filter){
      expect($filter('suffix')(undefined)).toEqual('');
    }));

    it('should handle cases of NaN', inject(function($filter){
      expect($filter('suffix')(NaN)).toEqual('');
    }));

    it('should handle cases of incorrectly formatted strings', inject(function($filter){
      expect($filter('suffix')("thirty-seven")).toEqual('');
    }));
  });

});
