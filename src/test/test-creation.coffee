path = require 'path'
helpers = require('yeoman-generator').test

describe 'angular-gulp-coffee generator', ->
  beforeEach (done) ->
    helpers.testDirectory path.join(__dirname, 'temp'), (err) =>
      if err
        return done(err)

      @app = helpers.createGenerator('angular-gulp-coffee:app', [
        '../../app'
      ])
      done()

  it 'creates expected files', (done) ->
    expected = [
      # add files you expect to exist here.
      '.editorconfig'
    ]

    helpers.mockPrompt @app,
      'someOption': true

    @app.options['skip-install'] = true
    @app.run {}, ->
      helpers.assertFiles(expected)
      done()
