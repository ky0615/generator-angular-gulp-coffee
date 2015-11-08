express = require "express"
path = require "path"
config = require 'config'
bodyParser = require "body-parser"

env = process.env.NODE_ENV || 'development'
app = express()
app.use bodyParser()

app.use (req, res, next)->
  res.set "X-Powered-By", "NodeJS"
  next()

static_base_path = path.join __dirname, 'www'
app.use express.static static_base_path

app.get /^\/(js|css|min)\/(.*)/, (req, res)->
  res.send "404 Not found", 404

app.get "*", (req, res)->
  res.sendfile path.join static_base_path, "index.html"
  return

console.log "NODE_ENV is " + env

if env is "production"
  app.set 'port', process.env.PORT || 1452
else
  app.set 'port', process.env.PORT || 1451
  gulp = require "./gulpfile"
  sequence = require "run-sequence"

  sequence "build", ->
    console.log "gulp build was successful"
    sequence "watch:assets", ->


server = app.listen app.get("port"), ->
  console.log "Server listening on pot " + server.address().port
