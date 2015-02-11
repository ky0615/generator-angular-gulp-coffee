(function() {
  var AngularGulpCoffeeGenerator, path, yeoman,
    __hasProp = {}.hasOwnProperty,
    __extends = function(child, parent) { for (var key in parent) { if (__hasProp.call(parent, key)) child[key] = parent[key]; } function ctor() { this.constructor = child; } ctor.prototype = parent.prototype; child.prototype = new ctor(); child.__super__ = parent.prototype; return child; };

  path = require('path');

  yeoman = require('yeoman-generator');

  module.exports = AngularGulpCoffeeGenerator = (function(_super) {
    __extends(AngularGulpCoffeeGenerator, _super);

    function AngularGulpCoffeeGenerator(args, options, config) {
      yeoman.generators.Base.apply(this, arguments);
      this.on('end', function() {
        return this.installDependencies({
          skipInstall: options['skip-install']
        });
      });
      this.pkg = JSON.parse(this.readFileAsString(path.join(__dirname, '../package.json')));
    }

    AngularGulpCoffeeGenerator.prototype.promptUser = function() {
      var cb, prompts,
        _this = this;
      cb = this.async();
      console.log(this.yeoman);
      prompts = [
        {
          name: 'appName',
          message: 'Enter your Application name?'
        }
      ];
      return this.prompt(prompts, function(props) {
        _this.appName = props.appName || 'project';
        return cb();
      });
    };

    AngularGulpCoffeeGenerator.prototype.promptDescription = function() {
      var cb, prompts,
        _this = this;
      cb = this.async();
      prompts = [
        {
          name: 'description',
          message: 'Enter your Application description?'
        }
      ];
      return this.prompt(prompts, function(props) {
        _this.description = props.description || 'new Application';
        return cb();
      });
    };

    AngularGulpCoffeeGenerator.prototype.promptNgApplication = function() {
      var cb, prompts,
        _this = this;
      cb = this.async();
      prompts = [
        {
          name: 'description',
          message: 'Enter your Angular Application name?'
        }
      ];
      return this.prompt(prompts, function(props) {
        _this.ngName = props.ngName || 'application';
        return cb();
      });
    };

    AngularGulpCoffeeGenerator.prototype.app = function() {
      var context;
      context = {
        appName: this.appName,
        description: this.description,
        ngName: this.ngName
      };
      this.template('_package.json', 'package.json', context);
      this.template('_bower.json', 'bower.json', context);
      this.copy('_gulpfile.coffee', 'gulpfile.coffee');
      this.copy('editorconfig', '.editorconfig');
      this.copy('gitignore', '.gitignore');
      this.copy('_app.coffee', 'app.coffee');
      this.mkdir('tasks');
      this.mkdir('tasks/config');
      this.mkdir('tasks/register');
      this.copy('_bower.coffee', 'tasks/config/bower.coffee');
      this.copy('_clean.coffee', 'tasks/config/clean.coffee');
      this.copy('_coffee.coffee', 'tasks/config/coffee.coffee');
      this.copy('_concat.coffee', 'tasks/config/concat.coffee');
      this.copy('_copy.coffee', 'tasks/config/copy.coffee');
      this.copy('_images.coffee', 'tasks/config/images.coffee');
      this.copy('_ngmin.coffee', 'tasks/config/ngmin.coffee');
      this.copy('_sass.coffee', 'tasks/config/sass.coffee');
      this.copy('_server.coffee', 'tasks/config/server.coffee');
      this.copy('_uglify.coffee', 'tasks/config/uglify.coffee');
      this.copy('_watch.coffee', 'tasks/config/watch.coffee');
      this.copy('_build.coffee', 'tasks/register/build.coffee');
      this.copy('_compileAssets.coffee', 'tasks/register/compileAssets.coffee');
      this.copy('_default.coffee', 'tasks/register/default.coffee');
      this.mkdir('assets');
      this.template('assets/_index.html', 'assets/index.html');
      this.mkdir('assets/css');
      this.mkdir('assets/css/lib');
      this.mkdir('assets/fonts');
      this.mkdir('assets/images');
      this.mkdir('assets/js');
      this.mkdir('assets/js/lib');
      this.mkdir('assets/templates');
      this.mkdir('assets/templates/parts');
      this.copy('assets/css/_style.scss', 'assets/css/style.scss');
      this.template('assets/js/_application.coffee', "assets/js/" + context.ngName + ".coffee");
      this.template('assets/js/_mock.coffee', 'assets/js/mock.coffee');
      this.template('assets/js/_parts.coffee', 'assets/js/parts.coffee');
      this.template('assets/js/controller/_ErrorController.coffee', 'assets/js/controller/ErrorController.coffee');
      this.template('assets/js/controller/_IndexController.coffee', 'assets/js/controller/IndexController.coffee');
      this.template('assets/js/controller/_MainController.coffee', 'assets/js/controller/MainController.coffee');
      return this.template('assets/templates/_index.html', 'assets/templates/index.html');
    };

    return AngularGulpCoffeeGenerator;

  })(yeoman.generators.Base);

}).call(this);
