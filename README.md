# basictheme

module nötig für:
- anzeigen, dass der Artikel bereits auf dem Wunschzettel ist (anpassen von oxwarticledetails.php)
  public function isArticleInWishlist() {
      if ($oUser = $this->getUser()) {
          $oProduct = $this->getProduct();
          $aArticles = $oUser->getBasket("wishlist")->getArticles();
          foreach ($aArticles as $oArticle) {
              if ($oArticle->oxarticles__oxid->value === $oProduct->oxarticles__oxid->value) {
                  return true;
              }
          }
      }
      return false;
  }

- ändern der Adressen mit account-controller (anpassen vom account-controllern mit function aus account-user (showShipAddress())
- abändern von oxcmp_user (changeuser_testvalues()) damit 'account' returnd wird und nicht 'account_user'





einmalig
global:

Überprüfen, ob nodejs installiert ist:
```console
$ node -v
```
falls nodejs noch nicht installiert ist:
```console
$ sudo apt-get install -y nodejs
```
nodejs auf die neueste stable version upgraden
```console
$ sudo npm cache clean -f
$ sudo npm install -g n
$ sudo n stable
```
überprüfen wo nodejs installiert wurde
which node
normalerweise /usr(/local)/bin/node

globale node module (packages) werden normalerweise unter /usr(/local)/lib/node_modules installiert (owner: root: man muss jedesmal sudo zum installieren verwenden)

Abändern des Speicherorts für globale packages
npm config list
npm config get prefix => /usr/local

Erstellen eines node_modules Ordners im home-verzeichnis:
cd && mkdir .node_modules_global
npm config set prefix=$HOME/.node_modules_global

npm nocheinmal im home-verzeichnis installieren:
npm install npm --global

Aufnahme der Änderung in der .profile oder .bash_profile Datei:
export PATH="$HOME/.node_modules_global/bin:$PATH"
Terminal neu starten.

$which npm zeigt nun auf den neuen Ordner

Globale npm-packages installieren
npm install gulp -g --save-dev (gulp muss sowohl lokal als auch global installiert werden)

Wechsel zum project-root verzeichnis:
npm install gulp --save-dev
npm install pump --save-dev (erweiterung für gulp für Fehlerhandling)

gulp-plugins installieren
npm install gulp-sass --save-dev (umwandlung von scss in css)
npm install --save-dev gulp-autoprefixer (hinzufügen von vendor prefixes (http://caniuse.com))
npm install gulp-sourcemaps --save-dev (erstellen einer sourcemap für browser-debugging)
npm install gulp-concat --save-dev (zusammenfügen mehrerer Dateien in eine)
npm install gulp-uglify --save-dev (minfy eine js-Datei)

erstellen einer gulpfile.js

erstellen der package.json:
npm init
{
	"name": "demo",
	"version": 1.0.0,
	"description": "Demo package.json",
	"main": "main.js",
	"dependencies": {},
	"devDependencies": {},
	"scripts": {},
	"author": "Author"
	"license": "ISC"
}

schreiben der gulpfile.js

Beispiel:
```javascript
// include gulp
var gulp = require('gulp');

// include plug-ins
var pump         = require('pump');
var sass         = require('gulp-sass');
var srcmaps      = require('gulp-sourcemaps');
var autoprefixer = require('gulp-autoprefixer');
var uglify       = require('gulp-uglify');
var concat       = require('gulp-concat');

// path to out/src-folder
var pathToSrc = './vendor/OXID-eSales/oxideshop_ce/source/out/absinthe/src/';

/***************************************************************************************************/
/*
 * create a task to convert scss into css, add nescessary vendor-prefixes and write a sourcemap
 *
 * define the dir where the scss-file(s) are, you want to convert into css.
 * define the dir where the css-file(s) should be saved to
 * define some options (optional)
 * define some autoprefixer-options (optional)
 * 
 * gulp-sass can compress the css file. if you want to use another plugin (like gulp-cssnano (takes much longer and only saves some kB)) you can set the outputStyle to 'expanded'
 */
 
/* SASS task */
var input_sass  = pathToSrc + 'scss/sass/*.scss';
var output_sass = pathToSrc + 'css/';
var sassOptions = {
	errLogToConsole: true,
	outputStyle: 'compressed' // or 'expanded'
};
var autoprefixerOptions = {
	browsers: ['last 2 versions', '> 5%', 'Firefox ESR']
};

gulp.task('sass', function(cb) {
	pump([
			gulp.src(input_sass),
			srcmaps.init(),
			sass(sassOptions),
			autoprefixer(autoprefixerOptions),
			srcmaps.write('./'),
			gulp.dest(output_sass)
		],
		cb
	);
});

/*
 * create a task to watch the scss-file(s) for changes. everytime a change is happening, the sass-task from above will be called
 */
/* SASS-WATCH task */
var input_watch_sass = pathToSrc + 'scss/sass/**/*.scss'; // (watch for changes in all subfolders)
gulp.task('watch_sass', function() {
	return gulp
		//Watch the input folder for change and run 'sass' task when something happens
		.watch(input_watch_sass, ['sass'])
		// When there is a change, log a message in the console
		.on('change', function(event) {
			console.log('File ' + event.path + ' was ' + event.type + ', running tasks...');
		});
});
/***************************************************************************************************/


/***************************************************************************************************/
/*
 * create a task to concat javascript-files in one file
 * define as many files as you want
 */
/* JS CONCAT task */
var input_concat  = [pathToSrc + 'js/absinth.js', pathToSrc + 'slinky/js/*.js'];
var output_concat = pathToSrc + 'js/dist/';

gulp.task('js_concat', function(cb) {
	pump([
			gulp.src(input_concat),
			concat({path:'all.js', newLine:';'}),
			gulp.dest(output_concat)
		],
		cb
	);
});

/*
 * create a task to watch for changes in the defined js-files
 */
/* JS CONCAT-WATCH task */
gulp.task('watch_concat', function() {
	return gulp
		.watch(input_concat, ['js_concat'])
		.on('change', function(event) {
			console.log('File ' + event.path + ' was ' + event.type + ', running tasks...');
		});
});
/***************************************************************************************************/


/***************************************************************************************************/
/*
 * create a task to minify the javascript file
 */
/* JS COMPRESS task */
var input_js  = pathToSrc + 'js/dist/*.js';
var output_js = pathToSrc + 'js/dist/minified/';

gulp.task('js_compress', function(cb) {
	pump([
			gulp.src(input_js),
			uglify(),
			gulp.dest(output_js)
		],
		cb
	);
});

/* JS COMPRESS-WATCH task */
gulp.task('watch_js', function() {
	return gulp
		.watch(input_js, ['js_compress'])
		.on('change', function(event) {
			console.log('File ' + event.path + ' was ' + event.type + ', running tasks...');
		});
});
/***************************************************************************************************/


/***************************************************************************************************/
/*
 * in order to only call "gulp" in the command-line at the project-root you can add the created tasks to the gulp-default-task
 */
/* default task (gulp) */
gulp.task('default', ['sass', 'watch_sass', 'js_concat', 'watch_concat', 'js_compress', 'watch_js']);
```
