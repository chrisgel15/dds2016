function BuscadorPois($stateParams, $state, poiService) {
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

	this.listaPois = [];

	this.buscarPois = function(){
		this.hayResultados = true;
		this.listaPois = poiService.poiService.listaPois;
		this.listaPois = filterPois(this.nombre, this.listaPois);
		$state.go("home");
	};


	this.limpiarResultados = function(){
		this.hayResultados = false;
		$state.go("home");
	};

	this.changeState = function changeState() {
		$state.go("testRoute");
	};

	this.VerDetalle = function (poi) {
		//$state.go("detalleComun", { 'id' : poi.prototype.id }, {reload : true});
		$state.go("detalleComun." + poi.prototype.tipo.toLowerCase() , { 'id' : poi.prototype.id }, {reload : true});
		//$state.go("detalle" , { 'id' : poi.prototype.id });
  };

}

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