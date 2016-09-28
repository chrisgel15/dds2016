function BuscadorPois($stateParams, $state, PoiService, $rootScope, UsuariosService) {
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
	self.mensajeError = "";

	self.listaPois = [];

	self.buscarPois = function(){
		self.mensajeError = "";
		self.listaPois = PoiService.buscarPois(self.nombre,
			function(response) { 
				self.hayResultados = true;
				console.log(response.data); 
				self.listaPois = _.map(response.data, transformarAPoi);
				console.log(self.listaPois);
				_.map(self.listaPois , MarcarFavoritos);
				console.log(self.listaPois);
				 } ,
			function(response) { 
				self.hayResultados = false;
				self.mensajeError = response.data;
			 } );
		$state.go("home");
	};


	self.limpiarResultados = function(){
		self.hayResultados = false;
		self.mensajeError = "";
		$state.go("home");
	};

	self.VerDetalle = function (poi) {
		console.log("home.detalleComun." + poi.tipo.toLowerCase() + "." + poi.id);
		$state.go("home.detalleComun." + poi.tipo.toLowerCase() , { 'id' : poi.id }, {reload : "home.detalleComun" });
  };

  function transformarAPoi(jsonPoi) {
		return Poi.asPoi(jsonPoi);
	}

	function MarcarFavoritos(poi)
	{
		poi.marcarFavorito(UsuariosService.favoritosId);
	}

	$rootScope.$on("$stateChangeError", function () {
        self.hayResultados = false;
		self.mensajeError = "No se puede mostrar el detalle.";
    });

    self.usuarioLogueado = UsuariosService.usuarioLogueado;

    if (!self.usuarioLogueado)
    	$state.go("login");
    

}