function Poi(nombre) {
	this.nombre = nombre;
}

function ParadaDeColectivo(nombre) {
	this.prototype = new Poi(nombre);
 }

// Test
var bondi = new ParadaDeColectivo('linea 20');
console.log(bondi);

function Banco(nombre, direccion)
{
	this.prototype = new Poi(nombre);
	this.direccion = direccion;
	this.servicios = [];
	this.agregarServicio = function(nombre, dia){
		this.servicios.push(new Servicio(nombre, dia, 10, 15));
	};
}

// Test
var banco = new Banco('Banco Santander');
banco.agregarServicio('servicio banco', 2);
console.log(banco);

function CGP(nombre, direccion)
{
	this.prototype = new Poi(nombre);
	this.direccion = direccion;
	this.servicios = [];
	this.agregarServicio = function (nombre, dia, horaInicio, horaFin){
		this.servicios.push(new Servicio(nombre, dia, horaInicio, horaFin));
	};
}

// Test
var cgp = new CGP('CGP 10');
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



