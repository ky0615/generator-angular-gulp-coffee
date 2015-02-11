angular.module "<%= ngName %>", ["ngRoute", "templates", "ui.bootstrap", "ngMockE2E"]
  .config ($routeProvider, $locationProvider) ->
    $locationProvider.html5Mode true
    $routeProvider
      .when "/",
        templateUrl: "index.html"
        controller: "IndexController"

      .otherwise
        # redirectTo: "/"
        templateUrl: "error.html"
        controller: "ErrorController"
    return
