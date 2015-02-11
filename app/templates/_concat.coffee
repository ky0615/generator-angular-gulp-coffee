###
Gulp task minify
@create 2014-12-15
@author KoutarouYabe <idolm@ster.pw>
###

module.exports = (gulp, plugins)->
  gulp.task "concat:js", ->
    gulp.src ["www/js/**/*.js", "!www/js/lib/*"]
    .pipe plugins.concat "bundle.min.js"
    .pipe gulp.dest "www/min"

  gulp.task "concat:css", ->
    gulp.src ["www/css/**/*.css", "!www/css/lib/*"]
    .pipe plugins.concatCss "bundle.min.css"
    .pipe gulp.dest "www/min"

  gulp.task "concat:template", ->
    gulp.src "assets/templates/**/*.html"
    .pipe plugins.angularTemplatecache standalone: true
    .pipe gulp.dest "www/js"
