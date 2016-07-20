###
Gulp task bower
@create 2014-10-07
@author KoutarouYabe <idolm@ster.pw>
###

module.exports = (gulp, plugins, path)->
  filter = plugins.filter
  jsFilter = filter ["**/*.js", "**/*.js.map"]
  cssFilter = filter "**/*.css"
  fontFilter = filter ["**/*.ttf", "**/*.svg", "**/*.eot", "**/*.woff", "**/*.woff2"]

  gulp.task "dependencies", ->
    dependenciesFiles = require("../pipeline").dependenciesFilesToInject

    plugins.util.log "---dependencies including file---"
    for bf in dependenciesFiles
      plugins.util.log path.basename bf
    plugins.util.log "--------------------------"

    gulp.src dependenciesFiles
      .pipe jsFilter
      .pipe gulp.dest plugins.config.destPath + "js/lib"
      .pipe jsFilter.restore()
      .pipe cssFilter
      .pipe gulp.dest plugins.config.destPath + "css/lib"
      .pipe cssFilter.restore()
      .pipe fontFilter
      .pipe gulp.dest plugins.config.destPath + "css/fonts"
