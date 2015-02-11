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
    @template '_package.json', 'package.json', context
    @template '_bower.json', 'bower.json', context
    @copy '_gulpfile.coffee', 'gulpfile.coffee'
    @copy 'editorconfig', '.editorconfig'
    @copy 'gitignore', '.gitignore'

    @copy '_app.coffee', 'app.coffee'

    @mkdir 'tasks'
    @mkdir 'tasks/config'
    @mkdir 'tasks/register'
    @copy '_bower.coffee', 'tasks/config/bower.coffee'
    @copy '_clean.coffee', 'tasks/config/clean.coffee'
    @copy '_coffee.coffee', 'tasks/config/coffee.coffee'
    @copy '_concat.coffee', 'tasks/config/concat.coffee'
    @copy '_copy.coffee', 'tasks/config/copy.coffee'
    @copy '_images.coffee', 'tasks/config/images.coffee'
    @copy '_ngmin.coffee', 'tasks/config/ngmin.coffee'
    @copy '_sass.coffee', 'tasks/config/sass.coffee'
    @copy '_server.coffee', 'tasks/config/server.coffee'
    @copy '_uglify.coffee', 'tasks/config/uglify.coffee'
    @copy '_watch.coffee', 'tasks/config/watch.coffee'
    @copy '_build.coffee', 'tasks/register/build.coffee'
    @copy '_compileAssets.coffee', 'tasks/register/compileAssets.coffee'
    @copy '_default.coffee', 'tasks/register/default.coffee'

    @mkdir 'assets'
    @template 'assets/_index.html', 'assets/index.html'
    @mkdir 'assets/css'
    @mkdir 'assets/css/lib'
    @mkdir 'assets/fonts'
    @mkdir 'assets/images'
    @mkdir 'assets/js'
    @mkdir 'assets/js/lib'
    @mkdir 'assets/templates'
    @mkdir 'assets/templates/parts'

    @copy 'assets/css/_style.scss', 'assets/css/style.scss'

    @template 'assets/js/_application.coffee', "assets/js/#{context.ngName}.coffee"
    @template 'assets/js/_mock.coffee', 'assets/js/mock.coffee'
    @template 'assets/js/_parts.coffee', 'assets/js/parts.coffee'
    @template 'assets/js/controller/_ErrorController.coffee', 'assets/js/controller/ErrorController.coffee'
    @template 'assets/js/controller/_IndexController.coffee', 'assets/js/controller/IndexController.coffee'
    @template 'assets/js/controller/_MainController.coffee', 'assets/js/controller/MainController.coffee'

    @template 'assets/templates/_index.html', 'assets/templates/index.html'

  # runNpm: ->
  #   console.log '\nDone loading files!\nInstalling Node modules and Bower packages...\n'
  #   @npmInstall '', ->
  #     console.log '\n Done installing node modules!\n Run \'npm start\' to build and serve the project'
  #   @bowerInstall '', ->
  #     console.log '\n  Done installing bower Packages\n'
