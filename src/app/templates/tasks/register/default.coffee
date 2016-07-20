###
Gulp task defauld
@create 2014-10-07
@author KoutarouYabe <idolm@ster.pw>
###

module.exports = (gulp, plugins)->
  gulp.task 'default', (cb)->
    log = plugins.util.log
    log "The front-end tools."
    log ""
    # log "gulp deploy         : Deploy front-end environment."
    # log "gulp watch          : Watch .scss and .coffee files."
    log "gulp build          : Compile .scss and .coffee files."
    # log "gulp help           : Print this help."
    log ""
    cb()
