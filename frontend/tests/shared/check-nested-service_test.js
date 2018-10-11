/*global describe, beforeEach, it, expect, inject, module*/
'use strict';

describe('CheckNested', function () {
  var service;

  beforeEach(module('shared'));

  beforeEach(inject(function (CheckNested) {
    service = CheckNested;
  }));

  it('should equal CheckNested', function () {
    var obj = {
      level1: {
        level2: {
          level3: 'hello'
        }
      }
    };
    expect(service.checkNested(obj)).toEqual(true);
    expect(service.checkNested(obj,'level1')).toEqual(true);
  });

});
