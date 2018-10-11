/*global describe, beforeEach, it, browser, expect */
'use strict';

var buildConfigFile = require('findup-sync')('build.config.js')
  , buildConfig = require(buildConfigFile)
  , ComparablesPagePo = require('./comparables.po');

describe('Comparables page', function () {
  var comparablesPage;

  beforeEach(function () {
    comparablesPage = new ComparablesPagePo();
    browser.driver.get(buildConfig.testingEnvironment.host + ':' + buildConfig.testingEnvironment.port + '/#/signout');
    browser.sleep(1000);
    browser.driver.get(buildConfig.testingEnvironment.host + ':' + buildConfig.testingEnvironment.port + '/#/signin');
    browser.sleep(1000);
  });

  it('should verify that the page is loading', function () {
    browser.driver.get(buildConfig.testingEnvironment.host + ':' + buildConfig.testingEnvironment.port + '/#/signout');
    browser.sleep(1000);
    global.login();
    browser.sleep(1000);
    browser.driver.get(buildConfig.testingEnvironment.host + ':' + buildConfig.testingEnvironment.port + '/#/entity/'+ buildConfig.testingCompany.duns_number);
    browser.sleep(1000);
    expect(browser.getCurrentUrl()).toContain('entity');
  });

  it('should verify the first block is Loss Ratio', function () {
    global.login();
    browser.sleep(1000);
    browser.driver.get(buildConfig.testingEnvironment.host + ':' + buildConfig.testingEnvironment.port + '/#/entity/'+ buildConfig.testingCompany.duns_number);
    browser.sleep(1000);
    expect(comparablesPage.firstPanel.getText()).toBe('Loss Ratio');
  });
});
