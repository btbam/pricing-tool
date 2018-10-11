/*global describe, beforeEach, it, expect, inject, module*/
'use strict';

describe('Loader', function () {
  var factory;

  beforeEach(module('shared'));

  beforeEach(inject(function (Loader) {
    factory = Loader;
  }));

  it('should have isLoading set by default', function () {
    expect(factory.isLoading).toEqual(true);
  });

  it('should set isLoading on clear', function () {
    factory.clear();
    expect(factory.isLoading).toEqual(false);
  });

  it('should set isLoading on setLoading', function () {
    factory.clear();
    factory.setLoading();
    expect(factory.isLoading).toEqual(true);
  });

});
