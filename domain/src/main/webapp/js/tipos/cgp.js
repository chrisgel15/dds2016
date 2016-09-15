'use strict'
function CGP(nombre, direccion, id, tipo, imagenUrl, comuna)
{
	this.prototype = new Poi(nombre, id, tipo, imagenUrl);
	this.direccion = direccion;
	this.servicios = [];
	this.comuna = comuna;
	this.agregarServicio = function (nombre, dia, horaInicio, horaFin){
		this.servicios.push(new Servicio(nombre, dia, horaInicio, horaFin));
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
var cgp = new CGP('CGP 10', 1, 'CGP', 'Comuna 5');
cgp.agregarServicio('servicio cgp', 2, 3,4);
console.log(cgp);
