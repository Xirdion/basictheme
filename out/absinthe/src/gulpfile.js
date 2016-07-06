// include gulp
var gulp = require('gulp');

// include plug-ins
var pump         = require('pump');
var sass         = require('gulp-sass');
var srcmaps      = require('gulp-sourcemaps');
var autoprefixer = require('gulp-autoprefixer');
var uglify       = require('gulp-uglify');
var concat       = require('gulp-concat');
//var sassdoc      = require('sassdoc');


/***************************************************************************************************/
/* SASS task */
var input_sass  = './scss/sass/*.scss';
var output_sass = './css/';
var sassOptions = {
	errLogToConsole: true,
	outputStyle: 'compressed'
	//outputStyle: 'expanded'
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

/***************************************************************************************************/
/* SASS-WATCH task */
var input_watch_sass = './scss/sass/**/*.scss'
gulp.task('watch_sass', function() {
	return gulp
		//Watch the input folder for change,
		// and run 'sass' task when something happens
		.watch(input_watch_sass, ['sass'])
		// When there is a change,
		// log a message in the console
		.on('change', function(event) {
			console.log('File ' + event.path + ' was ' + event.type + ', running tasks...');
		});
});

/***************************************************************************************************/
/* JS CONCAT task */
var input_concat  = ['./js/absinth.js', './slinky/js/*.js'];
var output_concat = './js/dist/';

gulp.task('js_concat', function(cb) {
	pump([
			gulp.src(input_concat),
			concat({path:'all.js', newLine:';'}),
			gulp.dest(output_concat)
		],
		cb
	);
});

/***************************************************************************************************/
/* JS CONCAT-WATCH task */
var input_watch_concat = ['./js/absinth.js', './slinky/js/*.js'];
gulp.task('watch_concat', function() {
	return gulp
		.watch(input_watch_concat, ['js_concat'])
		.on('change', function(event) {
			console.log('File ' + event.path + ' was ' + event.type + ', running tasks...');
		});
});

/***************************************************************************************************/
/* JS COMPRESS task */
var input_js  = './js/dist/*.js';
var output_js = './js/dist/minified/';

gulp.task('js_compress', function(cb) {
	pump([
			gulp.src(input_js),
			uglify(),
			gulp.dest(output_js)
		],
		cb
	);
});

/***************************************************************************************************/
/* JS COMPRESS-WATCH task */
var input_watch_js = './js/*.js'
gulp.task('watch_js', function() {
	return gulp
		.watch(input_watch_js, ['js_compress'])
		.on('change', function(event) {
			console.log('File ' + event.path + ' was ' + event.type + ', running tasks...');
		});
});

/***************************************************************************************************/
/* default task (gulp) */
gulp.task('default', ['sass', 'watch_sass', 'js_concat', 'watch_concat', 'js_compress', 'watch_js']);






/***************************************************************************************************/
// sass-doc task
var sassdocOption = {
	dest: './sassdoc'
};

gulp.task('sassdoc', function() {
	return gulp
		.src(input)
		.pipe(sassdoc(sassdocOption))
		.resume();
});
