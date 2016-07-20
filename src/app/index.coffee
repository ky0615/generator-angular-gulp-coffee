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

  promptNgApplication: ->
    cb = @async()

    prompts = [
      name: 'description'
      message: 'Enter your Angular Application name?'
    ]

    @prompt prompts, (props) =>
      @ngName = props.ngName || 'application'
      cb()

  app: ->
    context =
      appName: @appName
      description: @description
      ngName: @ngName
    @template 'package.json', 'package.json', context
    @copy 'gulpfile.coffee', 'gulpfile.coffee'
    @copy 'editorconfig', '.editorconfig'
    @copy 'gitignore', '.gitignore'

    @copy 'app.coffee', 'app.coffee'

    @mkdir 'tasks'
    @mkdir 'tasks/config'
    @mkdir 'tasks/register'
    @copy 'tasks/config/clean.coffee', 'tasks/config/clean.coffee'
    @copy 'tasks/config/coffee.coffee', 'tasks/config/coffee.coffee'
    @copy 'tasks/config/concat.coffee', 'tasks/config/concat.coffee'
    @copy 'tasks/config/copy.coffee', 'tasks/config/copy.coffee'
    @copy 'tasks/config/dependencies.coffee', 'tasks/config/dependencies.coffee'
    @copy 'tasks/config/ngmin.coffee', 'tasks/config/ngmin.coffee'
    @copy 'tasks/config/sass.coffee', 'tasks/config/sass.coffee'
    @copy 'tasks/config/server.coffee', 'tasks/config/server.coffee'
    @copy 'tasks/config/uglify.coffee', 'tasks/config/uglify.coffee'
    @copy 'tasks/config/watch.coffee', 'tasks/config/watch.coffee'
    @copy 'tasks/register/build.coffee', 'tasks/register/build.coffee'
    @copy 'tasks/register/compileAssets.coffee', 'tasks/register/compileAssets.coffee'
    @copy 'tasks/register/default.coffee', 'tasks/register/default.coffee'
    @copy 'tasks/pipeline.coffee', 'tasks/pipeline.coffee'

    @mkdir 'assets'
    @template 'assets/index.html', 'assets/index.html'
    @mkdir 'assets/css'
    @mkdir 'assets/css/lib'
    @mkdir 'assets/fonts'
    @mkdir 'assets/images'
    @mkdir 'assets/js'
    @mkdir 'assets/js/lib'
    @mkdir 'assets/templates'
    @mkdir 'assets/templates/parts'

    @copy 'assets/css/style.scss', 'assets/css/style.scss'

    @template 'assets/js/application.coffee', "assets/js/application.coffee"
    @template 'assets/js/mock.coffee', 'assets/js/mock.coffee'
    @template 'assets/js/parts.coffee', 'assets/js/parts.coffee'
    @template 'assets/js/controller/ErrorController.coffee', 'assets/js/controller/ErrorController.coffee'
    @template 'assets/js/controller/IndexController.coffee', 'assets/js/controller/IndexController.coffee'
    @template 'assets/js/controller/MainController.coffee', 'assets/js/controller/MainController.coffee'

    @template 'assets/templates/index.html', 'assets/templates/index.html'
    @template 'assets/templates/error.html', 'assets/templates/error.html'

  # runNpm: ->
  #   console.log '\nDone loading files!\nInstalling Node modules and Bower packages...\n'
  #   @npmInstall '', ->
  #     console.log '\n Done installing node modules!\n Run \'npm start\' to build and serve the project'
  #   @bowerInstall '', ->
  #     console.log '\n  Done installing bower Packages\n'
