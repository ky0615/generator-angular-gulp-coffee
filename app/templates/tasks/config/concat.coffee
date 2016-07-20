###
Gulp task minify
@create 2014-12-15
@author KoutarouYabe <idolm@ster.pw>
###

module.exports = (gulp, plugins)->
  gulp.task "concat:js", ->
    gulp.src require("../pipeline").jsFilesToInject
    .pipe plugins.concat "bundle.min.js"
    .pipe gulp.dest "www/min"

  gulp.task "concat:css", ->
    gulp.src require("../pipeline").cssFilesToInject
    .pipe plugins.concatCss "bundle.min.css"
    .pipe gulp.dest "www/min"

  gulp.task "concat:template", ->
    gulp.src require("../pipeline").templateFilesToInject
    .pipe plugins.angularTemplatecache standalone: true
    .pipe gulp.dest "www/js"
