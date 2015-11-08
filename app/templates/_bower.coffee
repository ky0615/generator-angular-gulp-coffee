###
Gulp task bower
@create 2014-10-07
@author KoutarouYabe <idolm@ster.pw>
###

module.exports = (gulp, plugins, growl, path)->
  filter = plugins.filter
  jsFilter = filter "**/*.js"
  cssFilter = filter "**/*.css"
  fontFilter = filter ["**/*.ttf", "**/*.svg", "**/*.eot", "**/*.woff", "**/*.woff2"]

  gulp.task "bower", ->
    bowerFiles = plugins.bowerFiles()
    bowerBasePath = path.resolve __dirname, "../../bower_components/"
    bowerFiles.push path.resolve bowerBasePath, "modernizr/modernizr.js"
    bowerFiles.push path.resolve bowerBasePath, "bootstrap/dist/css/bootstrap.min.css"
    bowerFiles.push path.resolve bowerBasePath, "bootstrap/dist/css/bootstrap-theme.min.css"

    bowerFiles.push path.resolve bowerBasePath, "bootstrap/dist/fonts/glyphicons-halflings-regular.eot"
    bowerFiles.push path.resolve bowerBasePath, "bootstrap/dist/fonts/glyphicons-halflings-regular.svg"
    bowerFiles.push path.resolve bowerBasePath, "bootstrap/dist/fonts/glyphicons-halflings-regular.ttf"
    bowerFiles.push path.resolve bowerBasePath, "bootstrap/dist/fonts/glyphicons-halflings-regular.woff"
    bowerFiles.push path.resolve bowerBasePath, "bootstrap/dist/fonts/glyphicons-halflings-regular.woff2"

    bowerFiles.push path.resolve bowerBasePath, "fontawesome/css/font-awesome.min.css"

    bowerFiles.push path.resolve bowerBasePath, "fontawesome/fonts/FontAwesome.otf"
    bowerFiles.push path.resolve bowerBasePath, "fontawesome/fonts/fontawesome-webfont.svg"
    bowerFiles.push path.resolve bowerBasePath, "fontawesome/fonts/fontawesome-webfont.woff"
    bowerFiles.push path.resolve bowerBasePath, "fontawesome/fonts/fontawesome-webfont.eot"
    bowerFiles.push path.resolve bowerBasePath, "fontawesome/fonts/fontawesome-webfont.ttf"
    bowerFiles.push path.resolve bowerBasePath, "fontawesome/fonts/fontawesome-webfont.woff2"

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
      .pipe gulp.dest plugins.config.destPath + "css/fonts"
