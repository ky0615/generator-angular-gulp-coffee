###
Gulp task bower
@create 2014-10-07
@author KoutarouYabe <idolm@ster.pw>
###

module.exports = (gulp, plugins, growl, path)->
  filter = plugins.filter
  jsFilter = filter "**/*.js"
  cssFilter = filter "**/*.css"
  fontFilter = filter ["**/*.ttf", "**/*.svg", "**/*.eot", "**/*.woff"]

  gulp.task "bower", ->
    bowerFiles = plugins.bowerFiles()
    bowerBasePath = path.resolve __dirname, "../../bower_components/"
    bowerFiles.push path.resolve bowerBasePath, "modernizr/modernizr.js"

    plugins.util.log "---bower including file---"
    for bf in bowerFiles
      plugins.util.log path.basename bf
    plugins.util.log "--------------------------"

    gulp.src bowerFiles
      .pipe jsFilter
      .pipe gulp.dest plugins.config.destPath + "js/lib"
      .pipe jsFilter.restore()
      .pipe cssFilter
      .pipe gulp.dest plugins.config.destPath + "css/lib"
      .pipe cssFilter.restore()
      .pipe fontFilter
      .pipe gulp.dest plugins.config.destPath + "fonts"
