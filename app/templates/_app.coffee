express = require 'express'
gulp = require "./gulpfile"
sequence = require "run-sequence"

path = require 'path'

app = express()

app.use (req, res, next)->
  res.set "X-Powered-By", "NodeJS"
  next()

static_base_path = path.join __dirname, 'www'
app.use express.static static_base_path
app.get "*", (req, res)->
  res.sendfile path.join static_base_path, "index.html"
  return

app.set 'port', process.env.PORT || 1451

environment = app.get "env"
console.log "NODE_ENV is " + environment
if environment is "development"
  sequence "build", ->
    console.log "gulp build was successful"
    sequence "watch:assets", ->
else
  sequence "build", ->

server = app.listen app.get("port"), ->
  console.log "Server listening on pot " + server.address().port
