/*global describe, beforeEach, it, expect, inject, module*/
'use strict';

describe('ComparablesFactory', function () {
  var factory;

  beforeEach(module('shared'));
  beforeEach(module('comparables'));

  beforeEach(inject(function (Comparables) {
    factory = Comparables;
  }));

  it('can get an instance of the factory', function () {
    expect(factory).toBeDefined();
  });

  it('should return array when getSingleSectionData is called', function () {
    expect(factory.getSingleSectionData()).toBeDefined();
  });

  it('should return array when getSectionsData is called', function () {
    expect(factory.getSectionsData()).toBeDefined();
  });

});
