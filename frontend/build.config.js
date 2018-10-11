'use strict';
var testConfig = require('./e2e/testConfig.js');
var $ = require('gulp-load-plugins')({
  pattern: [
    'yargs'
  ]
})
if ($.yargs.argv.stage === 'prod' || $.yargs.argv.stage === 'staging') {
  console.log('building to ' + $.yargs.argv.stage);
  module.exports = {
    host: 'localhost',
    port: 9001,

    // app directories
    appDir: 'app',

    // unit test directories
    unitTestDir: 'tests',

    // build directories
    buildDir: 'productionbuild/',
    buildCss: 'productionbuild/css/',
    buildCssFonts: 'productionbuild/css/fonts/',
    buildFonts: 'productionbuild/fonts/',
    buildImages: 'productionbuild/images/',
    buildJs: 'productionbuild/js/'
  };
}
else{
  console.log('building to dev');
  module.exports = {
    host: 'localhost',
    port: 9001,

    // app directories
    appDir: 'app',

    // unit test directories
    unitTestDir: 'tests',

    // build directories
    buildDir: 'build/',
    buildCss: 'build/css/',
    buildCssFonts: 'build/css/fonts/',
    buildFonts: 'build/fonts/',
    buildImages: 'build/images/',
    buildJs: 'build/js/',
    //for e2e and probably unit tests when they are written
    testingCompany: testConfig.company,
    testingUser: testConfig.user,
    testingEnvironment: testConfig.environment
  };
}
