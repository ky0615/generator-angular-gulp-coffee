path = require 'path'
yeoman = require 'yeoman-generator'

module.exports = class AngularGulpCoffeeGenerator extends yeoman.generators.Base
  constructor: (args, options, config) ->
    yeoman.generators.Base.apply this, arguments
    @on 'end', ->
      @installDependencies skipInstall: options['skip-install']

    @pkg = JSON.parse @readFileAsString path.join __dirname, '../package.json'

  promptUser: ->
    cb = @async()

    # have Yeoman greet the user.
    console.log @yeoman
    prompts = [
      name: 'appName'
      message: 'Enter your Application name?'
    ]

    @prompt prompts, (props) =>
      @appName = props.appName || 'project'
      cb()

  promptDescription: ->
    cb = @async()

    prompts = [
      name: 'description'
      message: 'Enter your Application description?'
    ]

    @prompt prompts, (props) =>
      @description = props.description || 'new Application'
      cb()

  app: ->
    @mkdir 'app'
    @mkdir 'app/templates'
    context =
      appName: @appName
      description: @description
    @template '_package.json', 'package.json', context
    @template '_bower.json', 'bower.json', context

  projectfiles: ->
    @copy 'editorconfig', '.editorconfig'

  # runNpm: ->
  #   console.log '\nDone loading files!\nInstalling Node modules and Bower packages...\n'
  #   @npmInstall '', ->
  #     console.log '\n Done installing node modules!\n Run \'npm start\' to build and serve the project'
  #   @bowerInstall '', ->
  #     console.log '\n  Done installing bower Packages\n'
