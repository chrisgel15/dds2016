
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
		$state.go(poi.prototype.tipo.toLowerCase() , { 'id' : poi.prototype.id });
  };

	

	
}

function PoiService() {

	var banco1 = new Banco('Banco Santander', 'Calle Falsa 123', 1, 'Banco', 'Zona 1');
	banco1.agregarServicio('Cajero Automatico', 'Lunes');
	banco1.agregarServicio('Extraccion', 'Martes');
	banco1.agregarServicio('Extraccion', 'Miercoles');

	var banco2 =  new Banco('Banco Galicia', 'Rivadavia 222', 4,'Banco', 'Zona 2');
	banco2.agregarServicio('Deposito', 'Jueves');
	banco2.agregarServicio('Pagos', 'Viernes');
	banco2.agregarServicio('Pagos', 'Lunes');

	var banco3 = new Banco('Banco Frances', 'Lavalle 767', 5, 'Banco', 'Zona 3');
	banco3.agregarServicio('Prestamos', 'Miercoles');
	banco3.agregarServicio('Seguros', 'Lunes a Viernes');
	banco3.agregarServicio('Pagos', 'Martes');

	this.listaPois = [ banco1,
					new CGP('CGP Comuna 10', 'direccion 2', 2, 'CGP'),
						new ParadaDeColectivo('Linea 27', 3, 'Colectivo'),
							banco2,
								banco3,
									new ParadaDeColectivo('Linea 441', 6, 'Colectivo') ];

	
	

	this.getPoiById = function (id) {
   		return _.find(this.listaPois, function (poi) {
     		return poi.prototype.id == id;
   		});
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


function DetallePoi($stateParams , $state, poiService){

	this.Poi = poiService.poiService.getPoiById($stateParams.id);

	if (!this.Poi){
		$state.go("home");
		return;
	}

	this.nombre = this.Poi.prototype.nombre;

}

function DetalleColectivo($stateParams , $state, poiService){

	this.Poi = poiService.poiService.getPoiById($stateParams.id);

	if (!this.Poi){
		$state.go("home");
		return;
	}

	this.nombre = this.Poi.prototype.nombre;

}

function DetalleBanco($stateParams , $state, poiService){

	this.Poi = poiService.poiService.getPoiById($stateParams.id);

	if (!this.Poi){
		$state.go("home");
		return;
	}

	this.nombre = this.Poi.prototype.nombre;
	this.direccion = this.Poi.direccion;
	this.zona = this.Poi.zona;
	this.servicios = this.Poi.servicios;

}




