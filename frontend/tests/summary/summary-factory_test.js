/*global describe, beforeEach, it, expect, inject, module*/
'use strict';

describe('Summary', function () {
  var factory;

  beforeEach(module('shared'));
  beforeEach(module('summary'));

  beforeEach(inject(function (Summary) {
    factory = Summary;
  }));

  it('can get an instance of the factory', function () {
    expect(factory).toBeDefined();
  });

});
