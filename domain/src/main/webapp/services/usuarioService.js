poiApp.service('UsuariosService', function($http) { 
	var self = this;

	self.usuarioLogueado = "";
	self.idUsuarioLogueado = "";
  self.favoritosId = [];

  self.usuarioObject = "";

  self.validarCredenciales = function (Usuario, callback, errorHandler) {
  	$http.post('/login',Usuario).then(callback, errorHandler);    
  };

  self.guardarUsuario = function(usuarioLogueado){
  	self.usuarioLogueado = usuarioLogueado.nombre;
  	self.idUsuarioLogueado = usuarioLogueado.id;
    self.favoritosId = usuarioLogueado.favoritos;

    self.usuarioObject = usuarioLogueado;

    console.log(self.favoritosId);
  };
});