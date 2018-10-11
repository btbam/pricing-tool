/*global describe, beforeEach, it, expect, inject, module*/
'use strict';

describe('formatPercentFromNumber', function () {
  beforeEach(module('shared'));

  it('should return a number multiplied by 100 and rounded to an integer', inject(function ($filter) {
    expect($filter('formatPercentFromNumber')("0.45643")).toEqual(46);
  }));

});
