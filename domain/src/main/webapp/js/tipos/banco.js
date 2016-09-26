'use strict'
function Banco(nombre, direccion, id, tipo, zona, imagenUrl)
{
	this.prototype = new Poi(nombre, id, tipo, imagenUrl);
	this.direccion = direccion;
	this.zona = zona;
	this.servicios = [];
	this.agregarServicio = function(nombre, dia){
		this.servicios.push(new Servicio(nombre, dia, 10, 15));
	};


	this.getServicios = function() {
		return this.servicios;
	};
}

Banco.asBanco = function (jsonBanco) {
  return angular.extend(new Banco(jsonBanco.nombre, jsonBanco.direccion, jsonBanco.id, jsonBanco.tipo, jsonBanco.zona ,
  		jsonBanco.imagenUrl), jsonBanco);
};


// Test
var banco = new Banco('Banco Santander', 1, 'Banco', 'Zona 1');
banco.agregarServicio('servicio banco', 2);
console.log(banco);