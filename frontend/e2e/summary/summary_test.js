/*global describe, beforeEach, it, browser, expect */
'use strict';

var buildConfigFile = require('findup-sync')('build.config.js'),
  buildConfig = require(buildConfigFile),
  SummaryPagePo = require('./summary.po');

describe('Summary page', function() {
  var summaryPage;

  beforeEach(function() {
    summaryPage = new SummaryPagePo();
    browser.driver.get(buildConfig.testingEnvironment.host + ':' + buildConfig.testingEnvironment.port + '/#/signout');
    browser.sleep(1000);
    browser.driver.get(buildConfig.testingEnvironment.host + ':' + buildConfig.testingEnvironment.port + '/#/signin');
    global.login();
    browser.sleep(2000);
    browser.driver.get(buildConfig.testingEnvironment.host + ':' + buildConfig.testingEnvironment.port + '/#/entity/' + buildConfig.testingCompany.duns_number);
    browser.sleep(2000);
  });

  it('should should have summary in the url', function() {
    expect(browser.getCurrentUrl()).toContain('entity');
  });

  it('should have correct values in company info', function() {
    expect(summaryPage.companyRevenue.getText()).toBe(buildConfig.testingCompany.revenue);
    expect(summaryPage.duns_number.getText()).toBe(buildConfig.testingCompany.duns_number);
    expect(summaryPage.address_street.getText()).toBe(buildConfig.testingCompany.address_street);
    expect(summaryPage.hq.getText()).toBe(buildConfig.testingCompany.hq);
    expect(summaryPage.industry.getText()).toBe(buildConfig.testingCompany.industry);
    // expect(summaryPage.ownership.getText()).toBe(buildConfig.testingCompany.ownership);
    expect(summaryPage.years_of_operation.getText()).toBe(buildConfig.testingCompany.years_of_operation);
  });

  it('should have a typeahead for nav bar search', function(){
    summaryPage.navbarSearch.clear();
    summaryPage.navbarSearch.sendKeys('inc');
    browser.sleep(2000);
    element.all(by.repeater('match in matches')).then(function(matches) {
      expect(matches.length).toEqual(7);
    });
  });

});
