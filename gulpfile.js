var gulp = require('gulp'),
    less = require('gulp-less'),
    minifyCss = require('gulp-minify-css'),
    uglify = require('gulp-uglify'),
    rename = require('gulp-rename'),
    rimraf = require('gulp-rimraf');


gulp.task('fromLessToCss', function(){
    return gulp.src('assets/less/styles.less')
        .pipe(less())
        .pipe(rename({ suffix: '.min' }))
        .pipe(minifyCss({compatibility: 'ie8'}))
        .pipe(gulp.dest('static/css'))
});


gulp.task('min_js', function(){
    return gulp.src('assets/js/*.js')
        .pipe(rename({ suffix: '.min' }))
        .pipe(uglify())
        .pipe(gulp.dest('static/js/'))
});


gulp.task('watch', function () {
    gulp.watch('assets/less/*.less', ['fromLessToCss']);
    gulp.watch('assets/js/*.js', ['min_js']);
});