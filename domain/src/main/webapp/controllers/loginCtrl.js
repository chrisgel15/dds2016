poiApp.controller('loginCtrl', function($stateParams, $state, UsuariosService) {
	var self = this;

	self.nombre = "";
	self.password = "";
	self.mensajeUsuarioIncorrecto = "";

	self.login = function(){
		self.mensajeUsuarioIncorrecto = "";
		UsuariosService.validarCredenciales({'nombre':self.nombre, 'password':self.password}, 
			function() { 
				$state.go("home");
			}, 
			function(mensajeError) { 
						self.mensajeUsuarioIncorrecto = mensajeError.data;
			});
	};
}); 