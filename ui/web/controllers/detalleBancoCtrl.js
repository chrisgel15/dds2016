function DetalleBanco($stateParams , $state, PoiService){

	//this.Poi = PoiService.poiService.getPoiById($stateParams.id);

	this.Poi = PoiService.poiService.getPoi();

	if (!this.Poi){
		$state.go("home");
		return;
	}

	this.direccion = this.Poi.direccion;
	this.zona = this.Poi.zona;
	this.servicios = this.Poi.servicios;

}




