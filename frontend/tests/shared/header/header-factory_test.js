/*global describe, beforeEach, it, expect, inject, module*/
'use strict';

describe('Header', function () {
  var factory;

  beforeEach(module('shared'));
  beforeEach(module('satellizer'));

  beforeEach(inject(function (Header, $auth) {
    factory = Header;
  }));

  it('should have getUser return user', function () {
    sessionStorage.setItem('username', 'test@pricing-tool.com');
    var sessionUsername = sessionStorage.getItem('username');
    expect(factory.getUser().email).toEqual(sessionUsername);
  });

});
