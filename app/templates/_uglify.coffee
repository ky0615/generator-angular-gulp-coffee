###
Gulp task uglify
@create 2014-12-15
@author KoutarouYabe <idolm@ster.pw>
###

module.exports = (gulp, plugins)->
  gulp.task "uglify:js", ->
    if plugins.config.env isnt "development"
      gulp.src ["www/min/bundle.min.js"]
      .pipe plugins.uglify()
      .pipe gulp.dest "www/min"

  gulp.task "uglify:css", ->
    if plugins.config.env isnt "development"
      gulp.src ["www/min/bundle.min.css"]
      .pipe plugins.minifyCss()
      .pipe gulp.dest "www/min"
