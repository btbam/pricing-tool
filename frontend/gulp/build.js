'use strict';

var gulp = require('gulp')
  , plumber = require('gulp-plumber')
  , path = require('path')
  , es = require('event-stream')
  , $ = require('gulp-load-plugins')({
    pattern: [
      'gulp-*',
      'main-bower-files',
      'rimraf',
      'streamqueue',
      'uglify-save-license',
      'wiredep',
      'yargs'
    ]
  })

  , buildConfig = require('../build.config.js')

  , appBase = buildConfig.appDir
  , appFontFiles = path.join(appBase, 'fonts/**/*')
  , appImages = path.join(appBase, 'images/**/*')
  , appMarkupFiles = path.join(appBase, '**/*.{haml,html,jade,filter.svg}')
  , appScriptFiles = path.join(appBase, '**/*.{coffee,js}')
  , appStyleFiles = path.join(appBase, '**/*.{css,less,scss,styl}')
  , isProd = $.yargs.argv.stage === 'prod' || $.yargs.argv.stage === 'staging';

// delete build directory
gulp.task('clean', function (cb) {
  return $.rimraf(buildConfig.buildDir, cb);
});

// compile markup files and copy into build directory
gulp.task('markup', ['clean'], function () {
  var hamlFilter = $.filter('**/*.haml')
    , jadeFilter = $.filter('**/*.jade');

  return gulp.src([
    appMarkupFiles
  ])
    .pipe(hamlFilter)
    .pipe($.haml())
    .pipe(hamlFilter.restore())
    .pipe(jadeFilter)
    .pipe($.jade())
    .pipe(jadeFilter.restore())
    .pipe(gulp.dest(buildConfig.buildDir));
});

// compile styles and copy into build directory
gulp.task('styles', ['clean'], function () {
  var lessFilter = $.filter('**/*.less')
    , scssFilter = $.filter('**/*.scss')
    , stylusFilter = $.filter('**/*.styl')
    , onError = function (err) {
      $.notify.onError({
        title: 'Syntax error in CSS',
        sound: ' ' //overrides defaults
      })(err);

      this.emit('end');
    };

  return gulp.src([
    appStyleFiles
  ])
    .pipe($.plumber({errorHandler: onError}))
    .pipe(lessFilter)
    .pipe($.less())
    .pipe(lessFilter.restore())
    .pipe(scssFilter)
    .pipe($.sass())
    .pipe(scssFilter.restore())
    .pipe(stylusFilter)
    .pipe($.stylus())
    .pipe(stylusFilter.restore())
    .pipe($.autoprefixer())
    .pipe($.if(isProd, $.concat('app.css')))
    .pipe($.if(isProd, $.cssmin()))
    .pipe($.if(isProd, $.rev()))
    .pipe(gulp.dest(buildConfig.buildCss));
});

// compile scripts and copy into build directory
gulp.task('scripts', ['clean', 'analyze', 'markup'], function () {
  var coffeeFilter = $.filter('**/*.coffee')
    , htmlFilter = $.filter('**/*.html')
    , jsFilter = $.filter('**/*.js');

  var config = gulp.src('config/' + (isProd ? $.yargs.argv.stage : 'dev') + '.json')
    .pipe($.ngConstant({name: 'shared.environment', deps: false}));

  var scripts = gulp.src([
    appScriptFiles,
    buildConfig.buildDir + '**/*.html',
    '!**/*_test.*',
    '!**/index.html'
  ])

  return es.merge(config, scripts)
    .pipe($.plumber())
    .pipe($.sourcemaps.init())
    .pipe(coffeeFilter)
    .pipe($.coffee())
    .pipe(coffeeFilter.restore())
    .pipe($.if(isProd, htmlFilter))
    .pipe($.if(isProd, $.ngHtml2js({
      moduleName: require('../package.json').name,
      declareModule: false
    })))
    .pipe($.if(isProd, htmlFilter.restore()))
    .pipe(jsFilter)
    .pipe($.if(isProd, $.angularFilesort()))
    .pipe($.if(isProd, $.concat('app.js')))
    .pipe($.if(isProd, $.ngAnnotate()))
    .pipe($.if(isProd, $.uglify()))
    .pipe($.if(isProd, $.rev()))
    .pipe($.sourcemaps.write())
    .pipe(gulp.dest(buildConfig.buildJs))
    .pipe(jsFilter.restore());
});

// inject custom CSS and JavaScript into index.html
gulp.task('inject', ['markup', 'styles', 'scripts'], function () {
  var jsFilter = $.filter('**/*.js');

  // build the main page
  return gulp.src(buildConfig.buildDir + 'index.html')
    .pipe($.inject(gulp.src([
      buildConfig.buildCss + '**/*',
      buildConfig.buildJs + '**/*'
    ])
    .pipe(jsFilter)
    .pipe($.angularFilesort())
    .pipe(jsFilter.restore()), {
      addRootSlash: false,
      ignorePath: buildConfig.buildDir
    }))
    .pipe(gulp.dest(buildConfig.buildDir));
});

// inject custom CSS and JavaScript into index.html
gulp.task('inject2', ['markup', 'styles', 'scripts'], function () {
  // build the 'upgrade' page
  // we only need the css
  return gulp.src(buildConfig.buildDir + '/upgrade/index.html')
    .pipe($.inject(gulp.src([
      buildConfig.buildCss + '**/*'
    ]),
    { relative: true }))
    .pipe(gulp.dest(buildConfig.buildDir + 'upgrade/'));
});

// copy bower components into build directory
gulp.task('bowerCopy', ['inject', 'inject2'], function () {
  var cssFilter = $.filter('**/*.css')
    , jsFilter = $.filter('**/*.js')
    , stream = $.streamqueue({objectMode: true})
    , wiredep = $.wiredep();

  if (wiredep.js) {
    stream.queue(gulp.src(wiredep.js));
  }

  if (wiredep.css) {
    stream.queue(gulp.src(wiredep.css));
  }

  return stream.done()
    .pipe(cssFilter)
    .pipe($.if(isProd, $.concat('vendor.css')))
    .pipe($.if(isProd, $.cssmin()))
    .pipe($.if(isProd, $.rev()))
    .pipe(gulp.dest(buildConfig.buildCss))
    .pipe(cssFilter.restore())
    .pipe(jsFilter)
    .pipe($.if(isProd, $.concat('vendor.js')))
    .pipe($.if(isProd, $.uglify({
      preserveComments: $.uglifySaveLicense
    })))
    .pipe($.if(isProd, $.rev()))
    .pipe(gulp.dest(buildConfig.buildJs))
    .pipe(jsFilter.restore());
});

// inject bower components into index.html
gulp.task('bowerInject', ['bowerCopy'], function () {
  if (isProd) {
    return gulp.src(buildConfig.buildDir + 'index.html')
      .pipe($.inject(gulp.src([
        buildConfig.buildCss + 'vendor*.css',
        buildConfig.buildJs + 'vendor*.js'
      ], {
        read: false
      }), {
        starttag: '<!-- bower:{{ext}} -->',
        endtag: '<!-- endbower -->',
        addRootSlash: false,
        ignorePath: buildConfig.buildDir
      }))
      .pipe($.htmlmin({
        collapseWhitespace: true,
        removeComments: true
      }))
      .pipe(gulp.dest(buildConfig.buildDir));
  } else {
    return gulp.src(buildConfig.buildDir + 'index.html')
      .pipe($.wiredep.stream({
        fileTypes: {
          html: {
            replace: {
              css: function (filePath) {
                return '<link rel="stylesheet" href="' + buildConfig.buildCss.replace(buildConfig.buildDir, '') +
                  filePath.split('/').pop() + '">';
              },
              js: function (filePath) {
                return '<script src="' + buildConfig.buildJs.replace(buildConfig.buildDir, '') +
                  filePath.split('/').pop() + '"></script>';
              }
            }
          }
        }
      }))
      .pipe(gulp.dest(buildConfig.buildDir));
  }
});

// copy fonts from Bower and custom fonts into build directory
gulp.task('fonts', ['clean'], function () {
  var fontFilter = $.filter('**/*.{eot,otf,svg,ttf,woff,woff2}');
  return gulp.src(
      $.mainBowerFiles().concat([appFontFiles]))
    .pipe(fontFilter)
    .pipe(gulp.dest(buildConfig.buildFonts))
    .pipe(gulp.dest(buildConfig.buildCssFonts))
    .pipe(fontFilter.restore());
});

// copy and optimize images into build directory
gulp.task('images', ['clean'], function () {
  return gulp.src(appImages)
    .pipe($.if(isProd, $.imagemin()))
    .pipe(gulp.dest(buildConfig.buildImages));
});

gulp.task('build', ['bowerInject', 'images', 'fonts']);
