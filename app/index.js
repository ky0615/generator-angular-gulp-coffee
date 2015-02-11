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

    AngularGulpCoffeeGenerator.prototype.app = function() {
      var context;
      this.mkdir('app');
      this.mkdir('app/templates');
      context = {
        appName: this.appName,
        description: this.description
      };
      this.template('_package.json', 'package.json', context);
      return this.template('_bower.json', 'bower.json', context);
    };

    AngularGulpCoffeeGenerator.prototype.projectfiles = function() {
      return this.copy('editorconfig', '.editorconfig');
    };

    return AngularGulpCoffeeGenerator;

  })(yeoman.generators.Base);

}).call(this);
