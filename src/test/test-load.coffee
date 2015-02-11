assert = require 'assert'

describe 'angular-gulp-coffee generator', ->
  it 'can be imported without blowing up', ->
    app = require '../app'
    assert(app?)
