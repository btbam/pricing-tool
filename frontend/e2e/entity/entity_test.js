/*global describe, beforeEach, it, browser, expect */
'use strict';

var buildConfigFile = require('findup-sync')('build.config.js')
  , buildConfig = require(buildConfigFile)
  , EntityPagePo = require('./entity.po');

describe('Entity page', function () {
  var entityPage;

  beforeEach(function () {
    entityPage = new EntityPagePo();
    browser.driver.get(buildConfig.testingEnvironment.host + ':' + buildConfig.testingEnvironment.port + '/#/signin');
  });

  it('should have the correct header', function () {
    browser.driver.get(buildConfig.testingEnvironment.host + ':' + buildConfig.testingEnvironment.port + '/#/signout');
    browser.sleep(1000);
    global.login();
    browser.sleep(3000);
    browser.driver.get(buildConfig.testingEnvironment.host + ':' + buildConfig.testingEnvironment.port + '/#/entity/'+ buildConfig.testingCompany.duns_number);
    browser.sleep(3000);
    expect(browser.getCurrentUrl()).toContain('entity');
  });
});
