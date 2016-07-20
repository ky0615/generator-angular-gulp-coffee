###
Gulp configure file

concatする際のファイルの順番を指定する
@create 2016-06-23
@author KoutarouYabe <idolm@ster.pw>
###

module.exports =
  cssFilesToInject: [
    "lib/**/*.css"
    "**/*.css"
  ].map (path)-> "www/css/" + path

  jsFilesToInject: [
    "lib/angular.js"
    "lib/**/*.js"
    "application.js"
    "**/*.js"
  ].map (path)-> "www/js/" + path

  templateFilesToInject: [
    "assets/**/*.html"
    "!assets/index.html"
  ]

  dependenciesFilesToInject: [
    "angular/angular.js"
    "angular-animate/angular-animate.js"
    "angular-aria/angular-aria.js"
    "angular-bootstrap/ui-bootstrap.js"
    "angular-bootstrap/ui-bootstrap-tpls.js"
    "angular-material/angular-material.css"
    "angular-material/angular-material.js"
    "angular-messages/angular-messages.min.js"
    "angular-mocks/angular-mocks.js"
    "angular-resource/angular-resource.js"
    "angular-sanitize/angular-sanitize.js"
    "angular-ui-router/release/angular-ui-router.js"
    "bootstrap/dist/css/bootstrap.css"
    "bootstrap/dist/css/bootstrap-theme.css"
    "bootstrap/dist/fonts/glyphicons-halflings-regular.eot"
    "bootstrap/dist/fonts/glyphicons-halflings-regular.svg"
    "bootstrap/dist/fonts/glyphicons-halflings-regular.ttf"
    "bootstrap/dist/fonts/glyphicons-halflings-regular.woff"
    "bootstrap/dist/fonts/glyphicons-halflings-regular.woff"
    "jquery/dist/jquery.js"
  ].map (path)-> require("path").resolve __dirname, "../node_modules/", path
