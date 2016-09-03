angular.module('poiApp')
.controller('usuariosCtrl',function (UsuariosService) {
	this.usuarios = UsuariosService.getAll();
});
  
  function ValidarUsuario(UsuariosService, nombre, pass) {
  var self = this;
  self.nombre = nombre;
  self.pass = pass;

  self.validarUsuario = function () {
  	if(UsuariosService.include(self.nombre, self.pass)){

  	};
  }
};