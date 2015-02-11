###
Gulp task ng-min
@create 2014-12-15
@author KoutarouYabe <idolm@ster.pw>
###

module.exports = (gulp, plugins)->
  gulp.task "ngmin", ->
    gulp.src "www/js/**/*"
    .pipe plugins.ngmin()
    .pipe gulp.dest "www/js/front.min.js"
