
function BuscadorPois() {
	this.nombre = [];

	this.nuevoCriterio = "";

	this.agregarCriterio = function(){
		if (this.nuevoCriterio != "" && this.nombre.indexOf(this.nuevoCriterio) == -1){
			this.nombre.push(this.nuevoCriterio);
			this.limpiarResultados();
		}
		this.nuevoCriterio = "";
		
	};

	this.limpiarCriterios = function(){
		this.nombre = [];
		this.limpiarResultados();
	};

	this.hayResultados = false;

	this.buscarPois = function(){
		this.hayResultados = true;
	};

	this.listaPois = listaPois;

	this.limpiarResultados = function(){
		this.hayResultados = false;
	};
}


var Poi = function(nombre , direccion, modal)
{
	this.nombre = nombre;
	this.direccion = direccion;
	this.modal = modal;
};

var listaPois = [ new Poi('nombre 1', 'direccion 1', 'bancoModal'),
new Poi('nombre 2', 'direccion 2','cgpModal'),
new Poi('nombre 3', 'direccion 3','localModal'),
new Poi('nombre 4', 'direccion 4','colectivoModal') ];
