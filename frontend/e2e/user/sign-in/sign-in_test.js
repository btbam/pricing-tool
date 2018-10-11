/*global describe, beforeEach, it, browser, expect */
'use strict';

var buildConfigFile = require('findup-sync')('build.config.js')
  , buildConfig = require(buildConfigFile)
  , SignInPagePo = require('./sign-in.po');

describe('Sign in page', function () {
  var signInPage,
    ptor;

  beforeEach(function () {
    signInPage = new SignInPagePo();
    browser.driver.get(buildConfig.testingEnvironment.host + ':' + buildConfig.testingEnvironment.port + '/#/signout');
    browser.sleep(1000);
    browser.driver.get(buildConfig.testingEnvironment.host + ':' + buildConfig.testingEnvironment.port + '/#/signin');
  });

  it('should load the page', function () {
    expect(signInPage.heading.getText()).toEqual('Sign in');
  });

  it('should redirect to search page after login', function () {
    global.login();
    expect(signInPage.searchHeading.getText()).toEqual('Search For an Entity');
    expect(browser.getCurrentUrl()).toContain('search');
  });

  it('should display a message for invalid credentials',function(){
    //browser.driver.get(buildConfig.testingEnvironment.host + ':' + buildConfig.testingEnvironment.port + '/#/signin');
    browser.sleep(1000);
    signInPage.email.sendKeys('fake@email.com');
    signInPage.password.sendKeys('wrongpassword');
    signInPage.submit.click();
    browser.sleep(1000);
    expect(element(by.css('#toast-container'))).toBeDefined();
    expect(element(by.css('.toast-message')).getText()).toContain('401 Unauthorized');
  });
});
