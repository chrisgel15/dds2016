function DetalleComun($stateParams, $state, PoiService){
	//this.Poi = PoiService.poiService.getPoiById($stateParams.id);

	this.Poi = PoiService.poiService.getPoi();

	if (!this.Poi){
		$state.go("home");
		return;
	}

	this.nombre = this.Poi.prototype.nombre;
	this.imagenUrl = this.Poi.prototype.imagenUrl;

}