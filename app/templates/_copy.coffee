###
Gulp task copy
@create 2014-10-07
@author KoutarouYabe <idolm@ster.pw>
###

module.exports = (gulp, plugins)->
  gulp.task "copy", ->
    gulp
      .src [
        "assets/**/**.!(coffee|less|sass|scss)"
        "!assets/images{,/**}"
        ]
      .pipe gulp.dest plugins.config.destPath
