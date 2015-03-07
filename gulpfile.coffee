gulp = require 'gulp'
coffee = require 'gulp-coffee'
concat = require 'gulp-concat'
uglify = require 'gulp-uglify'

sources =
  coffee: 'src/**/*.coffee'

gulp.task 'default', ->
  gulp.start 'compile:coffee', 'compile:less'

gulp.task 'compile:coffee', ->
  gulp.src sources.coffee
    .pipe coffee({bare: true})
    .pipe concat 'age-of-craft-randmizer.js'
    .pipe gulp.dest '.'
    .pipe uglify()
    .pipe concat 'gh-pages/age-of-craft-randmizer.min.js'
    .pipe gulp.dest '.'

gulp.task 'watch', ->
  gulp.watch sources.coffee , ['compile:coffee']
