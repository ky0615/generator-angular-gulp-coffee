(function() {
  var helpers, path;

  path = require('path');

  helpers = require('yeoman-generator').test;

  describe('angular-gulp-coffee generator', function() {
    beforeEach(function(done) {
      var _this = this;
      return helpers.testDirectory(path.join(__dirname, 'temp'), function(err) {
        if (err) {
          return done(err);
        }
        _this.app = helpers.createGenerator('angular-gulp-coffee:app', ['../../app']);
        return done();
      });
    });
    return it('creates expected files', function(done) {
      var expected;
      expected = ['.editorconfig'];
      helpers.mockPrompt(this.app, {
        'someOption': true
      });
      this.app.options['skip-install'] = true;
      return this.app.run({}, function() {
        helpers.assertFiles(expected);
        return done();
      });
    });
  });

}).call(this);
