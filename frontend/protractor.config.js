var glob = require('glob');
var timestamp = Math.floor(new Date() / 1000);
var buildConfig = require('./build.config.js');

exports.config = {
  seleniumServerJar: glob.sync('./node_modules/protractor/selenium/selenium-server-standalone-*.jar').join(),
  maxSessions: 5,
  //Multicapabilities has presidence over capabilities. If you use multicapabilities and --browser in your command
  //it will always run multicapabilities
  capabilities: {
    browserName: 'chrome',
    chromeOptions: {
      args: ['--test-type']
    }
  },
  seleniumArgs: ['-Dwebdriver.ie.driver=e2e/IEDriverServer.exe'],

  jasmineNodeOpts: {
    showColors: true,
    defaultTimeoutInterval: 30000
  },

  onPrepare: function() {
    var email = element(by.css('#user_email'));
    var password = element(by.css('#user_password'));
    var submit = element(by.css('[type="submit"]'));
    var ScreenShotReporter = require('protractor-screenshot-reporter');

    global.login = function(timeout) {
      if (!timeout) {
        timeout = 0;
      }
      browser.sleep(1000 + timeout);
      email.sendKeys(buildConfig.testingUser.email);
      password.sendKeys(buildConfig.testingUser.password);
      submit.click();
    }

    browser.getCapabilities().then(function(cap) {
      browser.browserName = cap.caps_.browserName;
    });

    // Add a screenshot reporter and store screenshots to `/tmp/screnshots`:
    jasmine.getEnv().addReporter(new ScreenShotReporter({
      baseDirectory: 'e2e_screenshots/'+ timestamp +'/'+ browser.browserName
    }));
  }
};
