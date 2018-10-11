/*global describe, beforeEach, it, browser, expect */
'use strict';

var buildConfigFile = require('findup-sync')('build.config.js')
  , buildConfig = require(buildConfigFile)
  , SignUpPagePo = require('./sign-up.po');

describe('Sign up page', function () {
  var signUpPage;

  beforeEach(function () {
    signUpPage = new SignUpPagePo();
    browser.driver.get(buildConfig.testingEnvironment.host + ':' + buildConfig.testingEnvironment.port + '/#/signup');
  });

  it('should have Signup in the url', function () {
    expect(browser.getCurrentUrl()).toContain('signup');
  });
});
