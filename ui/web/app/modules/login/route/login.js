angular.module('poi-app')
.config(function($stateProvider) {
  return $stateProvider
  .state('main.login', {
    url: "/",
    templateUrl: "app/modules/login/login.html",
    controller: "usuariosCtrl",
    controllerAs:"usuariosCtrl"
  });
});