/*global describe, beforeEach, it, browser, expect */
'use strict';

var buildConfigFile = require('findup-sync')('build.config.js')
  , buildConfig = require(buildConfigFile)
  , CalculatorPagePo = require('./calculator.po');

describe('Calculator page', function () {
  var calculatorPage;

  beforeEach(function () {
    calculatorPage = new CalculatorPagePo();
      browser.driver.get(buildConfig.testingEnvironment.host + ':' + buildConfig.testingEnvironment.port + '/#/signin');

  });

  it('should say CalculatorCtrl', function () {
    browser.driver.get(buildConfig.testingEnvironment.host + ':' + buildConfig.testingEnvironment.port + '/#/signout');
    browser.sleep(1000);
    global.login();
    browser.sleep(3000);
    browser.driver.get(buildConfig.testingEnvironment.host + ':' + buildConfig.testingEnvironment.port + '/#/entity/'+ buildConfig.testingCompany.duns_number);
    browser.sleep(3000);
    expect(calculatorPage.title.getText()).toEqual('Private D&O');
  });
});
