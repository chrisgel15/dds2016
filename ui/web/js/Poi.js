function Poi(nombre, id, tipo, imagenUrl) {
	this.nombre = nombre;
	this.id = id;
	this.tipo = tipo;
	this.imagenUrl = imagenUrl;
}





function HorarioDeAtencion(dia, horaInicio, horaFin)
{
	this.dia = dia;
	this.horaInicio = horaInicio;
	this.horaFin = horaFin;
}

// Test
var horario = new HorarioDeAtencion(1, 2, 3);
console.log(horario);


function Servicio(nombre, dia, horaInicio, horaFin){
	this.nombre = nombre;
	this.horarios = [ new HorarioDeAtencion(dia, horaInicio, horaFin) ];
	this.agregarHorario = function(dia, horaInicio, horaFin){
		this.horarios.push(new HorarioDeAtencion(dia, horaInicio, horaFin));
	};
}

// Test
var servicio = new Servicio('atencion al cliente', 1, 4, 530);
servicio.agregarHorario(2, 4, 5);
console.log(servicio);



function FiltrarPorString(objeto, string){
	return objeto.toLowerCase().indexOf(string.toLowerCase());
}


function FiltrarPorDireccion(objeto)
{
	this.filtro = function(filtro){
		if (FiltrarPorString(objeto.direccion, filtro) > -1)
			return objeto;
	};
}

function FiltrarPorServicio(objeto){

	this.filtro = function(filtro){
		var i = 0;
		for ( i = 0; i < objeto.servicios.length ; i++)
			if (FiltrarPorString(objeto.servicios[i].nombre, filtro) > -1)
				return objeto;
	};
}

function FiltrarPorNombre(objeto){

	this.filtro = function(filtro) {
		if (FiltrarPorString(objeto.prototype.nombre, filtro) > -1)
			return objeto;
	};
}


