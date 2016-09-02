
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
		this.listaPois = filterPois(this.nombre, listaPois)
	};

	this.listaPois = [];

	this.limpiarResultados = function(){
		this.hayResultados = false;
	};
}


var listaPois = [ new Banco('Banco Santander', 'direccion 1'),
new CGP('CGP Comuna 10', 'direccion 2'),
new ParadaDeColectivo('linea 27'),
new Banco('Banco Galicia', 'direccion 4'),
new Banco('Banco Frances', 'direccion 5')
];

function filterPois(array , lista)
{
	var arrayFiltrado = [];
	var longitudArray = array.length;
	var indice = 0;

	for (indice ; indice < longitudArray ; indice++)
		arrayFiltrado.push($filter('filter')(lista, array[indice], true));

	return arrayFiltrado;
}




