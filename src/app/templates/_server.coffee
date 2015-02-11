###
Gulp task sass compile
@create 2014-10-07
@author KoutarouYabe <idolm@ster.pw>
###

module.exports = (gulp, plugins)->
  gulp.task "server", ->
    connect = require 'gulp-connect'
    connect.server
      root: "www"
      livereload: true
      host: "0.0.0.0"
      port: "1451"