'use strict';

var gulp = require('gulp')
  , path = require('path')
  , $ = require('gulp-load-plugins')()

  , appBase = require('../build.config.js').appDir
  , appScriptFiles = path.join(appBase, '**/*.{coffee,js}')

  , e2eFiles = 'e2e/**/*.{coffee,js}'
  , unitTests = path.join(require('../build.config.js').unitTestDir, '**/*_test.{coffee,js}');

// lint CoffeeScript and jshint and jscs JavaScript
gulp.task('lint', function () {
  var coffeeFilter = $.filter(['**/*.coffee'])
    , jsFilter = $.filter(['**/*.js','!vendor/*', '!**/*_test.js', '!**/*.po.js', '!**/testConfig.js'])
    , onError = function (err) {
      $.notify.onError({
        title: 'Error linting the JS',
        sound: '' //overrides defaults
      })(err);

      this.emit('end');
    };

  return gulp.src([
    appScriptFiles,
    e2eFiles,
    unitTests
  ])
    .pipe(coffeeFilter)
    .pipe($.coffeelint('coffeelint.conf.json'))
    .pipe($.coffeelint.reporter())
    .pipe($.coffeelint.reporter('fail'))
    .pipe(coffeeFilter.restore())
    .pipe(jsFilter)
    .pipe($.jshint())
    .pipe($.jshint.reporter('jshint-stylish'))
    .pipe($.jshint.reporter('fail'))
    .pipe($.jscs());
});

// run plato anaylysis on JavaScript files
gulp.task('staticAnalysis', function () {
  var jsFilter = $.filter('**/*.js');

  return gulp.src([
    appScriptFiles,
    e2eFiles,
    unitTests
  ])

    .pipe(jsFilter)
    .pipe($.plato('report'));
});

gulp.task('analyze', ['lint', 'staticAnalysis']);
