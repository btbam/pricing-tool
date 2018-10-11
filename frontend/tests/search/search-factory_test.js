/*global describe, beforeEach, it, expect, inject, module*/
'use strict';

describe('Search', function () {
  var factory;

  beforeEach(module('pricing_tool_front'));


  beforeEach(inject(function (Search) {
    factory = Search;
  }));

  it('should have get() defined', function () {
    expect(factory.get()).toBeDefined();
  });

});
