/*global describe, beforeEach, it, browser, expect */
'use strict';

var buildConfigFile = require('findup-sync')('build.config.js')
  , buildConfig = require(buildConfigFile)
  , CompanyInfoPagePo = require('./company-info.po');

describe('CompanyInfo Section', function () {
  var companyInfoPage;

  beforeEach(function () {
    companyInfoPage = new CompanyInfoPagePo();
    browser.driver.get(buildConfig.testingEnvironment.host + ':' + buildConfig.testingEnvironment.port + '/#/signin');
  });

  it('should say company name and have the correct url', function () {
    browser.driver.get(buildConfig.testingEnvironment.host + ':' + buildConfig.testingEnvironment.port + '/#/signout');
    browser.sleep(1000);
    global.login();
    browser.sleep(3000);
    browser.driver.get(buildConfig.testingEnvironment.host + ':' + buildConfig.testingEnvironment.port + '/#/entity/'+ buildConfig.testingCompany.duns_number);
    browser.sleep(3000);
    expect(companyInfoPage.heading.getText()).toEqual(buildConfig.testingCompany.name);
    expect(browser.getCurrentUrl()).toContain('entity');
  });
});
