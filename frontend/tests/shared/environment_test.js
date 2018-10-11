/*global describe, beforeEach, it, expect, inject, module*/
'use strict';

beforeEach(function() {
    // This will run before every test, and mock global ENV constants
    module('shared.environment', function($provide) {
      $provide.constant('ENV', 'development'); // mocked ENV constnat
      $provide.constant('API_PATH', 'http://127.0.0.1:3000'); // mocked API_PATH constant
      $provide.constant('HEAP_ID', '1421601133'); // mocked ENV constnat
    });
});

describe('Environment', function () {

  it('ENV should be development', inject(function (ENV) {
    expect(ENV).toBe('development');
  }));

  it('API_PATH should be correct', inject(function (API_PATH) {
    expect(API_PATH).toBe('http://127.0.0.1:3000');
  }));

  it('HEAP_ID should be correct', inject(function (HEAP_ID) {
    expect(HEAP_ID).toBe('1421601133');
  }));

});
