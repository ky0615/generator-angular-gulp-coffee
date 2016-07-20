angular.module "application"
.controller "ErrorController", ($rootScope, $scope, $state)->
  $scope.text = $state.params.status
