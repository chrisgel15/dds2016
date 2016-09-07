function Poi(nombre, id, tipo) {
	this.nombre = nombre;
	this.id = id;
	this.tipo = tipo;
}

function ParadaDeColectivo(nombre, id, tipo) {
	this.prototype = new Poi(nombre, id, tipo);

	this.FiltrarPorNombre = new FiltrarPorNombre(this);

	this.Filtrar = function(filtro){
		return this.FiltrarPorNombre.filtro(filtro);
	};
	
 }

// Test
var bondi = new ParadaDeColectivo('linea 20', 1, 'Colectivo');
console.log(bondi);

function Banco(nombre, direccion, id, tipo, zona)
{
	this.prototype = new Poi(nombre, id, tipo);
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
}



// Test
var banco = new Banco('Banco Santander', 1, 'Banco', 'Zona 1');
banco.agregarServicio('servicio banco', 2);
console.log(banco);

function CGP(nombre, direccion, id, tipo)
{
	this.prototype = new Poi(nombre, id, tipo);
	this.direccion = direccion;
	this.servicios = [];
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
}

// Test
var cgp = new CGP('CGP 10', 1, 'CGP');
cgp.agregarServicio('servicio cgp', 2, 3,4);
console.log(cgp);

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


