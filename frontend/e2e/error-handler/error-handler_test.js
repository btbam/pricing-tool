/*global describe, beforeEach, it, browser, expect */
'use strict';

var buildConfigFile = require('findup-sync')('build.config.js')
  , buildConfig = require(buildConfigFile)
  , ErrorHandlerPagePo = require('./error-handler.po');

describe('Error handler page', function () {
  var errorHandlerPage;

  beforeEach(function () {
    errorHandlerPage = new ErrorHandlerPagePo();
    browser.driver.get(buildConfig.host + ':' + buildConfig.port + '/#/signin');
  });

  xit('should display error message as toast', function () {
    // TODO: figure out how to trigger an http error on the front end
    // this test is handled in sign in for invalid credentials.
    // leaving it here in case we want better coverage
  });
});
