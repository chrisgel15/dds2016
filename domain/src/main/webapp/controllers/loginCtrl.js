poiApp.controller('loginCtrl', function($stateParams, $state, UsuariosService) {
	var self = this;

	self.nombre = "";
	self.password = "";
	self.mensajeUsuarioIncorrecto = "";

	self.usuarioLogueado = "";

	self.login = function(){
		self.mensajeUsuarioIncorrecto = "";
		UsuariosService.validarCredenciales({'nombre':self.nombre, 'password':self.password}, 
			function(usuario) { 
				UsuariosService.guardarUsuario(new Usuario(usuario.data.nombre, usuario.data.password, 
												usuario.data.id, usuario.data.favoritosId));
				$state.go("home");
			}, 
			function(mensajeError) { 
						self.mensajeUsuarioIncorrecto = mensajeError.data;
			});
	};
}); 