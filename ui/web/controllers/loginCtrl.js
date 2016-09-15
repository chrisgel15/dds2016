/*angular.module('poiApp')
.controller('loginCtrl',function ($stateParams, $state, usuariosService) {
	this.usuarios = UsuariosService.getAll();
});*/
  
function ValidarUsuario($stateParams, $state, UsuariosService) {
  var self = this;
  self.nombre = nombre;
  self.pass = pass;

  self.validarUsuario = function () {
  	if(usuariosService.include(self.nombre, self.pass)){
		  $state.go("home");
  	};
  	//$state.go("login");
    $state.go("home");
  }
};