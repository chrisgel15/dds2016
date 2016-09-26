poiApp.service('UsuariosService', function($http) { 
	var self = this;

	self.usuarioLogueado = "";
	self.idUsuarioLogueado = "";

  self.validarCredenciales = function (Usuario, callback, errorHandler) {
  	$http.post('/login',Usuario).then(callback, errorHandler);    
  };

  self.guardarUsuario = function(usuarioLogueado){
  	self.usuarioLogueado = usuarioLogueado.nombre;
  	self.idUsuarioLogueado = usuarioLogueado.id;
  };
});