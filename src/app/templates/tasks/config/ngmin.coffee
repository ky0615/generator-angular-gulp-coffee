###
Gulp task ng-min
@create 2014-12-15
@author KoutarouYabe <idolm@ster.pw>
###

module.exports = (gulp, plugins)->
  gulp.task "ngmin", ->
    gulp.src ["www/js/**/*.js", "!www/js/lib/**/*.js"]
    .pipe plugins.ngAnnotate()
    .pipe gulp.dest "www/js"
