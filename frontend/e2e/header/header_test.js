/*global describe, beforeEach, it, browser, expect */
'use strict';

var buildConfigFile = require('findup-sync')('build.config.js')
  , buildConfig = require(buildConfigFile)
  , HeaderPagePo = require('./header.po');

describe('Header', function () {
  var headerPage;

  beforeEach(function () {
    headerPage = new HeaderPagePo();
    browser.driver.get(buildConfig.testingEnvironment.host + ':' + buildConfig.testingEnvironment.port + '/#/');
  });

  it('should say pricing-tool', function () {
    expect(headerPage.heading.getText()).toEqual('pricing-tool');
  });
});
