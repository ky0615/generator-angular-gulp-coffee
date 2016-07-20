###
Gulp task compileAssets
@create 2014-10-07
@author KoutarouYabe <idolm@ster.pw>
###

module.exports = (gulp, plugins)->
  gulp.task 'compileAssets', (cb)->
    plugins.sequence(
      'clean',
      ['dependencies', 'coffee', 'sass', 'copy', 'concat:template'],
      'ngmin',
      ['concat:js', 'concat:css'],
      # ['uglify:js', 'uglify:css'],
      cb
    )
