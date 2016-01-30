###
Gulp task watch
@create 2014-10-07
@author KoutarouYabe <idolm@ster.pw>
###

module.exports = (gulp, plugins, growl, path)->
  gulp.task "watch:assets", ->
    plugins.livereload = plugins.livereload.listen()
    plugins.watch ["assets/**/*.sass", "assets/**/*.scss"], (file)->
      plugins.util.log file.path.yellow + " was changed"
      plugins.sequence "sass", "reload"
    plugins.watch ["assets/**/*.coffee"], (file)->
      plugins.util.log file.path.yellow + " was changed"
      plugins.sequence "coffee","concat:js", "uglify:js", "reload"
    plugins.watch ["assets/images/**/*"], (file)->
      plugins.util.log file.path.yellow + " was changed"
      plugins.sequence "images", "reload"
    plugins.watch [
        "assets/**/**.!(coffee|less|sass|scss)"
        "!assets/images{,/**}"
        ], (file)->
      plugins.util.log file.path.yellow + " was changed"
      plugins.sequence(
        ["copy", 'concat:template'],
        'concat:js',
        'uglify:js',
        "reload"
        )

  gulp.task "reload", ->
    plugins.util.log "page was reloaded"
    gulp
      .src "assets/**/*"
      .pipe plugins.livereload
        quiet: true

  gulp.task "watch", ->
    plugins.sequence(
      ["build", "server"]
      "watch:assets"
      )
