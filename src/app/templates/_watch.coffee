###
Gulp task watch
@create 2014-10-07
@author KoutarouYabe <idolm@ster.pw>
###

module.exports = (gulp, plugins, growl, path)->
  gulp.task "watch:assets", ->
    plugins.livereload = plugins.livereload.listen()
    plugins.watch ["assets/**/*.sass", "assets/**/*.scss"], (file, cb)->
      plugins.sequence "sass", "reload", cb
    plugins.watch ["assets/**/*.coffee"], (file, cb)->
      plugins.sequence "coffee","concat:js", "uglify:js", "reload", cb
    plugins.watch ["assets/images/**/*"], (file, cb)->
      plugins.sequence "images", "reload", cb
    plugins.watch [
        "assets/**/**.!(coffee|less|sass|scss)"
        "!assets/images{,/**}"
        ], (file, cb)->
      plugins.sequence(
        ["copy", 'concat:template'],
        'concat:js',
        'uglify:js',
        "reload",
        cb
        )

  gulp.task "reload", ->
    gulp
      .src "assets/**/*"
      .pipe plugins.livereload()

  gulp.task "watch", ->
    plugins.sequence(
      ["build", "server"]
      "watch:assets"
      )
