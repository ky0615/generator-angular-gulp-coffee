###
Gulp task build
@create 2014-10-07
@author KoutarouYabe <idolm@ster.pw>
###

module.exports = (gulp, plugins)->
  gulp.task 'build', (cb)->
    plugins.sequence(
      'compileAssets',
      cb
    )
