function Usuario (nombre, pass, estado, tipo) {
	return { nombre: nombre, pass: pass, estado: estado, tipo: tipo };
}

usuarios = [
	new Usuario("admin@dds.com", "admin124", "Activo", "Admin" ),
	new Usuario("federicoMadri@dds.com", "Fede123", "Activo", "Admin" ),
	new Usuario("rominaCuadra@dds.com", "Romi123", "Activo", "Admin" ),
	new Usuario("christianGelman@dds.com", "Chris123", "Activo", "Admin" ),
	new Usuario("ajuanPabloFerreira@dds.com", "JuamPy123", "Activo", "Admin" ),
];

function usuariosService() {
	var self = this;

	self.getAll = function () {
		return usuarios;
	};

	self.get = function (nombre, pass) {
		return _.find(propiedades, { nombre: nombre pass: pass});
	};
	
	self.create = function (usuario) {
		propiedades.push(usuario);
	};

	self.delete = function (nombre, pass) {
		_.remove(propiedades, function(nombre, pass) { return _.isMatch(obj, { nombre: nombre pass: pass }); });
	}

	self.include = function (nombre, pass){
		return (_.size(_.find(propiedades,{ nombre: nombre pass: pass}) == 1));
	}

};

angular.module("booking-app")
.factory("UsuariosService", function() {
	return new UsuariosService();
});