/*global describe, beforeEach, it, expect, inject, module*/
'use strict';

describe('formatZeroOrNA', function () {
  beforeEach(module('shared'));

  it('should return a "N/A" for a null value', inject(function ($filter) {
    expect($filter('formatZeroOrNA')(null)).toEqual("N/A");
  }));

});
