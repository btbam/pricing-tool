/*global describe, beforeEach, it, browser, expect */
'use strict';

var buildConfigFile = require('findup-sync')('build.config.js')
  , buildConfig = require(buildConfigFile)
  , SignoutPagePo = require('./signout.po');

describe('Signout page', function () {
  var signoutPage;

  beforeEach(function () {
    signoutPage = new SignoutPagePo();
    browser.driver.get(buildConfig.testingEnvironment.host + ':' + buildConfig.testingEnvironment.port + '/#/signout');
  });

  it('should have signin in the url', function () {
    browser.sleep(1000);
    expect(browser.getCurrentUrl()).toContain('signin');
  });
});
