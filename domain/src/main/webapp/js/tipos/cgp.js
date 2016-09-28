'use strict'
function CGP(nombre, direccion, id, tipo, imagenUrl, comuna)
{
	this.prototype = new Poi(nombre, id, tipo, imagenUrl);
	this.direccion = direccion;
	this.comuna = comuna;
	this.servicios = [];
	this.agregarServicio = function (nombre, dia, horaInicio, horaFin){
		this.servicios.push(new Servicio(nombre, dia, horaInicio, horaFin));
	};

	this.getServicios = function() {
		return this.servicios;
	};
}


CGP.asCgp = function (jsonCgp) {
  return angular.extend(new CGP(jsonCgp.nombre, jsonCgp.direccion, jsonCgp.id, jsonCgp.tipo, jsonCgp.imagenUrl ,
  		jsonCgp.comuna), jsonCgp);
};

// Test
var cgp = new CGP('CGP 10', 1, 'CGP', 'Comuna 5');
cgp.agregarServicio('servicio cgp', 2, 3,4);
console.log(cgp);
