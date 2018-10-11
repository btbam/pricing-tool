/*global describe, beforeEach, it, browser, expect */
'use strict';

var buildConfigFile = require('findup-sync')('build.config.js')
  , buildConfig = require(buildConfigFile)
  , AllResultsPagePo = require('./all-results.po');

describe('All results page', function () {
  var allResultsPage;

  beforeEach(function () {
    allResultsPage = new AllResultsPagePo();
    browser.driver.get(buildConfig.testingEnvironment.host + ':' + buildConfig.testingEnvironment.port + '/#/signout');
    browser.sleep(1000);
    browser.driver.get(buildConfig.testingEnvironment.host + ':' + buildConfig.testingEnvironment.port + '/#/signin');
    global.login();
    browser.sleep(1000);
    browser.driver.get(buildConfig.testingEnvironment.host + ':' + buildConfig.testingEnvironment.port + '/#/all-results/llc');
    browser.sleep(3000);
  });

  it('should show all search results', function() {
    expect(browser.getCurrentUrl()).toContain('all-results');
    expect(browser.getCurrentUrl()).toContain('llc');
    //expect results count to be > 0
    expect(allResultsPage.resultsCount.getText()).toEqual('All Results');
  });

  it('should update all search results when nav search is updated', function() {
    allResultsPage.navSearchInput.clear()
    allResultsPage.navSearchInput.sendKeys('inc');
    allResultsPage.results.then(function(results) {
      expect(results.length).toEqual(50);
    });
  });

});
