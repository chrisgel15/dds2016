function ValidaUsuario($stateParams, $state, UsuariosService)
{
	var self = this;
	var usuarios = [];

	this.getUsuarios = function() {
	    UsuariosService.findAll(function(response) {
	    	self.usuarios = response.data;
	    });
	};	

	this.getUsuarios();

	
}
