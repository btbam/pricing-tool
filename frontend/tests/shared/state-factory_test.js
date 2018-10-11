/*global describe, beforeEach, it, expect, inject, module*/
'use strict';

describe('State', function () {
  var factory;

  beforeEach(module('shared'));

  beforeEach(inject(function (State) {
    factory = State;
  }));

  it('should have currentState return State', function () {
    expect(factory.currentState().current.name).toEqual('');
  });

});
