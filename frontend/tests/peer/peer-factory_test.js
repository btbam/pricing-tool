/*global describe, beforeEach, it, expect, inject, module*/
'use strict';

describe('Peer', function () {
  var factory;

  beforeEach(module('shared'));
  beforeEach(module('peer'));

  beforeEach(inject(function (Peer) {
    factory = Peer;
  }));

  it('should return a promise for getData', function () {
    expect(factory.getData().success()).toBeDefined();
  });

  it('can get an instance of the factory', function () {
    expect(factory).toBeDefined();
  });

});
