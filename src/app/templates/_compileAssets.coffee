###
Gulp task compileAssets
@create 2014-10-07
@author KoutarouYabe <idolm@ster.pw>
###

module.exports = (gulp, plugins)->
  gulp.task 'compileAssets', (cb)->
    plugins.sequence(
      'clean',
      ['bower', 'coffee', 'sass', 'copy', 'concat:template'],
      'concat:js',
      ['uglify:js', 'images'],
      cb
    )
