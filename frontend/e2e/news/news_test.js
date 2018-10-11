/*global describe, beforeEach, it, browser, expect */
'use strict';

var buildConfigFile = require('findup-sync')('build.config.js'),
  buildConfig = require(buildConfigFile),
  NewsPagePo = require('./news.po');

describe('News page', function() {
  var newsPage;

  beforeEach(function() {
    newsPage = new NewsPagePo();
    browser.driver.get(buildConfig.testingEnvironment.host + ':' + buildConfig.testingEnvironment.port + '/#/signout');
    browser.sleep(1000);
    browser.driver.get(buildConfig.testingEnvironment.host + ':' + buildConfig.testingEnvironment.port + '/#/signin');
    browser.sleep(1000);
    global.login();
    browser.sleep(1000);
    browser.driver.get(buildConfig.testingEnvironment.host + ':' + buildConfig.testingEnvironment.port + '/#/entity/' + buildConfig.testingCompany.duns_number);
    browser.sleep(3000);
    //click new section so it expands. removing but leaving in case we re insert the accordion
    // newsPage.newsSection.click();
    browser.sleep(3000);
  });

  it('should display 20 results when searching news', function() {
    newsPage.input.clear();
    newsPage.input.sendKeys('inc');
    newsPage.newsSearchButton.click();
    browser.sleep(3000);
    // not using PO because it updates later
    var results = element.all(by.css('.result'));
    expect(results.count()).toBe(20);
    browser.sleep(2000);
    element.all(by.css('.page')).get(1).click();
    browser.sleep(1000);
    results = element.all(by.css('.result'));
    expect(results.count()).toBe(20);
  });

  it('should work with enter',function(){
    newsPage.input.sendKeys('inc')
    newsPage.input.sendKeys(protractor.Key.ENTER);
    browser.sleep(3000);
    var results = element.all(by.css('.result'));
    expect(results.count()).toBe(20);
  });

});
