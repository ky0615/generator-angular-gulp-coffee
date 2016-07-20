angular.module "<%= ngName %>", ["ngMaterial", "ngResource", "ngMessages", "ui.router", "ui.bootstrap"]
.config ($stateProvider, $locationProvider, $urlRouterProvider)->
  $locationProvider.html5Mode true
  $stateProvider
  .state "main",
    url: '/'
    templateUrl: 'templates/index.html'
    controller: 'IndexController'
  .state "404",
    templateUrl: "templates/error.html"
    controller: "ErrorController"
    params: status: "404 Not Found"

  $urlRouterProvider
  .otherwise ($injector)->
    $injector.get("$state").go("404");

