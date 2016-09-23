function BuscadorPois($stateParams, $state, PoiService) {
	var self = this;

	self.nombre = [];

	self.nuevoCriterio = "";

	self.agregarCriterio = function(){
		if (self.nuevoCriterio != "" && self.nombre.indexOf(this.nuevoCriterio) == -1){
			self.nombre.push(this.nuevoCriterio);
			self.limpiarResultados();
		}
		self.nuevoCriterio = "";
		
	};

	self.limpiarCriterios = function(){
		self.nombre = [];
		self.limpiarResultados();
	};

	self.hayResultados = false;

	self.listaPois = [];

	self.buscarPois = function(){
		self.hayResultados = true;
		self.listaPois = PoiService.buscarPois(self.nombre,
			function(response) { 
				console.log(response.data); 
				self.listaPois = _.map(response.data, transformarAPoi);
				console.log(self.listaPois); } ,
			function() { alert("error!"); } );
		$state.go("home");
	};


	self.limpiarResultados = function(){
		self.hayResultados = false;
		$state.go("home");
	};

	self.VerDetalle = function (poi) {
		$state.go("home.detalleComun." + poi.prototype.tipo.toLowerCase() , { 'id' : poi.prototype.id }, {reload : "home.detalleComun" });
  };

  function transformarAPoi(jsonPoi) {
		return Poi.asPoi(jsonPoi);
	}

}