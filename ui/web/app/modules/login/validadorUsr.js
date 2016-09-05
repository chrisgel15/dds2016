function ValidadorUsr() {
	this.nombre = [];

	this.usuario = "";

	this.buscarUsuario = function(){
		if (this.usuario != "" ){
			this.nombre.push(this.usuario);
		}
		this.usuario = "";
	};

	this.validarUsuario = function(nombre, pass){
		
	}
}
