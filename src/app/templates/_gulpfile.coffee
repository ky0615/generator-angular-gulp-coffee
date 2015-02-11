###
Gulp configure script.
@create 2014-10-07
@author KoutarouYabe <idolm@ster.pw>
###

# TODO switches if you have growl application
growl = false

loadTasks = (path)->
  includeAll(
    dirname: require("path").resolve __dirname, path
    filter: /(.+)\.(js|coffee)$/
  ) or {}

invokeConfigFn = (tasks) ->
  for taskName of tasks
    plugins.error = (error)->
      plugins.util.log error.toString()
    tasks[taskName] gulp, plugins, growl, path  if tasks.hasOwnProperty(taskName)

gulp = require "gulp"
plugins = require("gulp-load-plugins")(
  pattern: [
    "gulp-*"
    "merge-*"
    "run-*"
    "main-*"
  ]
  replaceString: /\bgulp[\-.]|run[\-.]|merge[\-.]|main[\-.]/
  camelizePluginName: true
  lazy: true
)

plugins.config =
  destPath: "./www/"
  env: process.env.ENV_VARIABLE || "development"
plugins.colors = require "colors"

path = require "path"
includeAll = require "include-all"

taskConfigurations = loadTasks "./tasks/config"
registerDefinitions = loadTasks "./tasks/register"

if not registerDefinitions.default
  registerDefinitions.default = (gulp)->
    gulp.task 'default', []

invokeConfigFn taskConfigurations
invokeConfigFn registerDefinitions

module.exports = gulp
