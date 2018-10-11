/*global describe, beforeEach, it, expect, inject, module*/
'use strict';

describe('AllResults', function () {
  var factory;

  beforeEach(module('shared'));
  beforeEach(module('all-results'));

  beforeEach(inject(function (AllResults) {
    factory = Search;
  }));

});
