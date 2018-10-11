/*global describe, beforeEach, it, browser, expect */
'use strict';

var buildConfigFile = require('findup-sync')('build.config.js'),
  buildConfig = require(buildConfigFile),
  SearchPagePo = require('./search.po');

describe('Search page', function() {
  var searchPage;

  beforeEach(function() {
    searchPage = new SearchPagePo();
    browser.driver.get(buildConfig.testingEnvironment.host + ':' + buildConfig.testingEnvironment.port + '/#/signout');
    browser.sleep(1000);
    browser.driver.get(buildConfig.testingEnvironment.host + ':' + buildConfig.testingEnvironment.port + '/#/signin');
    global.login();
  });

  it('should load the header', function() {
    expect(searchPage.searchHeading.getText()).toEqual('Search For an Entity');
    expect(browser.getCurrentUrl()).toContain('search');
  });

  it('should search by duns number and be sent to summary on enter', function() {
    searchPage.searchInput.clear();
    //fill out form
    searchPage.searchInput.sendKeys(buildConfig.testingCompany.duns_number);
    searchPage.searchInput.sendKeys(protractor.Key.ENTER);
    //submit
    expect(browser.getCurrentUrl()).toContain('entity/' + buildConfig.testingCompany.duns_number);
  });

  it('should go to all search results', function() {
    searchPage.searchInput.clear();
    searchPage.searchInput.sendKeys(buildConfig.testingCompany.duns_number);
    browser.sleep(1000);
    element.all(by.repeater('match in matches')).get(1).click()
    expect(browser.getCurrentUrl()).toContain('all-results');
    expect(searchPage.resultsCount.getText()).toEqual('All Results');
    searchPage.firstResult.click();
    expect(browser.getCurrentUrl()).toContain('entity');
  });

  it('should have 7 items (maximum) in typeahead', function() {
    searchPage.searchInput.clear();
    searchPage.searchInput.sendKeys('wal');
    browser.sleep(3000);
    element.all(by.repeater('match in matches')).then(function(matches) {
      expect(matches.length).toEqual(7);
    });
  });

  it('should search by address', function() {
    searchPage.searchInput.clear();
    searchPage.searchInput.sendKeys(buildConfig.testingCompany.address_street);
    browser.sleep(3000);
    element.all(by.repeater('match in matches')).then(function(matches) {
      expect(matches.length).toEqual(2);
    });
  })
});
