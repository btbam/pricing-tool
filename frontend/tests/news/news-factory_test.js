/*global describe, beforeEach, it, expect, inject, module*/
'use strict';

describe('News', function () {
  var factory;

  beforeEach(module('shared'));
  beforeEach(module('news'));

  beforeEach(inject(function (News) {
    factory = News;

  }));

  it('should return a promise for getArticles', function () {
    expect(factory.getArticles(123).success()).toBeDefined();
  });

  it('should have search() return News', function () {
    expect(factory.search('inc', 1).success()).toBeDefined();
    expect(factory.search('inc').success()).toBeDefined();
  });

  it('can get an instance of the factory', function () {
    expect(factory).toBeDefined();
  });

});
