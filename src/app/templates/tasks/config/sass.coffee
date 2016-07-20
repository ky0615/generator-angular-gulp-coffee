###
Gulp task sass compile
@create 2014-10-07
@author KoutarouYabe <idolm@ster.pw>
###

module.exports = (gulp, plugins)->
  gulp.task "sass", ->
    gulp.src [
        "assets/css/**/*.sass",
        "assets/css/**/*.scss"
      ]
    .pipe plugins.plumber()
    .pipe plugins.sass bare: true
    .on 'error', plugins.error
    .pipe gulp.dest plugins.config.destPath + "css/"
