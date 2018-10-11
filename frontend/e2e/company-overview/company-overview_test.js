/*global describe, beforeEach, it, browser, expect */
'use strict';

var buildConfigFile = require('findup-sync')('build.config.js')
  , buildConfig = require(buildConfigFile)
  , CompanyOverviewPagePo = require('./company-overview.po');

describe('Company overview page', function () {
  var companyOverviewPage;

  beforeEach(function () {
    companyOverviewPage = new CompanyOverviewPagePo();
    browser.driver.get(buildConfig.testingEnvironment.host + ':' + buildConfig.testingEnvironment.port + '/#/signin');

  });

  it('should have company info, summary, and calculator', function () {
    browser.driver.get(buildConfig.testingEnvironment.host + ':' + buildConfig.testingEnvironment.port + '/#/signout');
    browser.sleep(1000);
    global.login();
    browser.sleep(3000);
    browser.driver.get(buildConfig.testingEnvironment.host + ':' + buildConfig.testingEnvironment.port + '/#/entity/'+ buildConfig.testingCompany.duns_number);
    browser.sleep(3000);
    expect(companyOverviewPage.companyInfo).toBeDefined();
    expect(companyOverviewPage.summary).toBeDefined();
    expect(companyOverviewPage.calculator).toBeDefined();
  });
});
