/*global describe, beforeEach, it, expect, inject, module*/
'use strict';

describe('ErrorInterceptor', function () {
  var factory, $q;

  beforeEach(module('shared'));
  beforeEach(module('errorHandler'));

  beforeEach(inject(function (responseInterceptor, _$httpBackend_, _$q_) {
    factory = responseInterceptor;
    $q = _$q_;

  }));

  it('should be defined', function () {
    expect(factory).toBeDefined();
  });

  describe('when HTTP 401', function(){
    it('should give an error',function(){
      var rejection = {status:401, message:''};
      var r = factory.responseError(rejection);
      expect(r.$$state.value.message).toBe('The server encountered a temporary error and could not complete your request. Please try again.');
    });
  });

  describe('when HTTP 0', function(){
    it('should give an error',function(){
      var deferred = $q.defer();
      var rejection = {status:0, message:''};
      var r = factory.responseError(rejection);
      deferred.resolve();
      expect(r.$$state.value.message).toBe('The server encountered a temporary error and could not complete your request. Please try again.');
    });
  });

  describe('when HTTP 200', function(){
    it('should not give an error',function(){
      var deferred = $q.defer();
      var response = {data: {status:200, message:''}};
      var r = factory.response(response);
      deferred.resolve();
      expect(r.data.message).toBe('');
    });
  });
});
