###
Gulp task images compile
@create 2014-10-07
@author KoutarouYabe <idolm@ster.pw>
###

module.exports = (gulp, plugins)->
  gulp.task "images", ->
    gulp.src ["assets/images/**/*"]
    .pipe plugins.cache plugins.imagemin
      optimizationLevel: 3
      progressive: true
      interlaced: true
    .pipe gulp.dest plugins.config.destPath + "images/"
