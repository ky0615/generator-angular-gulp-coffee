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

    AngularGulpCoffeeGenerator.prototype.askFor = function() {
      var cb, prompts,
        _this = this;
      cb = this.async();
      console.log(this.yeoman);
      prompts = [
        {
          type: 'confirm',
          name: 'someOption',
          message: 'Would you like to enable this option? This is just a test',
          "default": true
        }
      ];
      return this.prompt(prompts, function(props) {
        _this.someOption = props.someOption;
        return cb();
      });
    };

    AngularGulpCoffeeGenerator.prototype.app = function() {
      this.mkdir('app');
      this.mkdir('app/templates');
      this.copy('_package.json', 'package.json');
      return this.copy('_bower.json', 'bower.json');
    };

    AngularGulpCoffeeGenerator.prototype.projectfiles = function() {
      return this.copy('editorconfig', '.editorconfig');
    };

    return AngularGulpCoffeeGenerator;

  })(yeoman.generators.Base);

}).call(this);
