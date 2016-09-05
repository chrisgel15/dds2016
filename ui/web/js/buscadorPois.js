
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
		this.listaPois = filterPois(this.nombre, listaPois);
	};

	this.listaPois = [];

	this.limpiarResultados = function(){
		this.hayResultados = false;
	};
}


var listaPois = [ new Banco('Banco Santander', 'direccion 1', 1),
new CGP('CGP Comuna 10', 'direccion 2', 2),
new ParadaDeColectivo('linea 27', 3),
new Banco('Banco Galicia', 'direccion 4', 4),
new Banco('Banco Frances', 'direccion 5', 5)
];

function filterPois(array , lista)
{
	var i = 0, j = 0;
	returnLista = [];

	for (i = 0; i < array.length ; i++)
		for (j = 0; j < lista.length ; j++)
		{
			var value = lista[j].Filtrar(array[i]);
			if ( value != -1 && value != undefined )
				returnLista.push(value);			
		}

	return returnLista;
}




