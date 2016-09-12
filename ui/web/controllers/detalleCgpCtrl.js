function DetalleCgp($stateParams , $state, PoiService){

	//this.Poi = PoiService.poiService.getPoiById($stateParams.id);

	this.Poi = PoiService.poiService.getPoi();

	if (!this.Poi){
		$state.go("home");
		return;
	}

//	this.direccion = this.Poi.direccion;
	this.comuna = this.Poi.comuna;
//	this.servicios = this.Poi.servicios;

}




