function DetalleBanco($stateParams , $state, PoiService){

//	this.Poi = PoiService.poiService.getPoiById($stateParams.id);

	this.Poi = PoiService.poiService.getPoi();

	if (!this.Poi){
		$state.go("home");
		return;
	}

	this.zona = this.Poi.zona;




}




