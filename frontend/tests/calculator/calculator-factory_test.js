/*global describe, beforeEach, it, expect, inject, module*/
'use strict';

describe('Calculator', function () {
  var factory;

  beforeEach(module('calculator'));

  beforeEach(inject(function (Calculator) {
    factory = Calculator;
  }));

  it('can get an instance of the factory', function () {
    expect(factory).toBeDefined();
  });

  it('should have getData() defined', function () {
    expect(factory.getData()).toBeDefined();
  });
});
