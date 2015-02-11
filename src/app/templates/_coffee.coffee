###
Gulp task coffee compile
@create 2014-10-07
@author KoutarouYabe <idolm@ster.pw>
###

module.exports = (gulp, plugins)->
  gulp.task "coffee", ->
    gulp.src [
        "assets/js/**/*.coffee"
      ]
    .pipe plugins.plumber()
    .pipe plugins.coffee bare: true
    .pipe plugins.ngmin()
    .on 'error', plugins.error
    .pipe gulp.dest plugins.config.destPath + "js/"
