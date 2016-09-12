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
		var i = 0, j = 0;
		var returnServicios = [];
		for (i = 0; i < this.servicios.length ; i++)
		{
			for (j = 0; j < this.servicios[i].horarios.length ; j++)
				returnServicios.push({ 'nombre': this.servicios[i].nombre + ' - '
						 + this.servicios[i].horarios[j].dia + ' Desde: ' + 
						 + this.servicios[i].horarios[j].horaInicio + ' Hasta: ' + 
						 + this.servicios[i].horarios[j].horaFin });
		}
		return returnServicios;
	};
}

// Test
var cgp = new CGP('CGP 10', 1, 'CGP', 'Comuna 5');
cgp.agregarServicio('servicio cgp', 2, 3,4);
console.log(cgp);
