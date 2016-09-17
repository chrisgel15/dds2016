poiApp.controller('loginCtrl', function($stateParams, $state, UsuariosService) {
	var self = this;

	self.nombre = "";
	self.password = "";
	self.showMensajeUsuarioIncorrecto = false;
	self.mensajeUsuarioIncorrecto = "";

	self.login = function(){
		self.showMensajeUsuarioIncorrecto = false;
		UsuariosService.validarCredenciales({'nombre':self.nombre, 'password':self.password}, 
			function() { 
				$state.go("home");
			}, 
			function(mensajeError) { 
						self.showMensajeUsuarioIncorrecto = true;						
						self.mensajeUsuarioIncorrecto = mensajeError.data;
			});
	};
}); 