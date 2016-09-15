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

	this.FiltrarPorDireccion = new FiltrarPorDireccion(this);

	this.FiltrarPorServicio = new FiltrarPorServicio(this);

	this.FiltrarPorNombre = new FiltrarPorNombre(this);

	this.Filtrar = function(filtro){
		return this.FiltrarPorDireccion.filtro(filtro) || 
			this.FiltrarPorServicio.filtro(filtro) || 
				this.FiltrarPorNombre.filtro(filtro);
	};

	this.getServicios = function() {
		return this.servicios;
	};
}

// Test
var banco = new Banco('Banco Santander', 1, 'Banco', 'Zona 1');
banco.agregarServicio('servicio banco', 2);
console.log(banco);