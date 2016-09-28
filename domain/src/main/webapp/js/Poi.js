function Poi(nombre, id, tipo, imagenUrl) {
	var self = this;

	self.nombre = nombre;
	self.id = id;
	self.tipo = tipo;
	self.imagenUrl = imagenUrl;
	self.esFavorito = false;

	self.marcarFavorito = function(favoritosUsuario) {
		if (_.includes(favoritosUsuario, self.id,0))
			self.esFavorito = true;
		else
			self.esFavorito = false;
	};

	self.CalcularPromedio = function(listaReviews){
		var i;
		var sum = 0;

		for (i=0 ; i<listaReviews.length ; i++)
		{
			sum += listaReviews[i].puntaje;
		}

		if (listaReviews.length > 0)
			sum = sum / listaReviews.length;

		return sum; 
	};
}

Poi.asPoi = function (jsonPoi) {
  return angular.extend(new Poi(), jsonPoi);
};

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


