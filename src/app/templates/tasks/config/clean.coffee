###
Gulp task clean
@create 2014-10-07
@author KoutarouYabe <idolm@ster.pw>
###

module.exports = (gulp, plugins)->
  gulp.task "clean", ->
    gulp.src [
        plugins.config.destPath + "*"
      ], read: false
    .pipe plugins.plumber()
    .pipe plugins.rimraf()
