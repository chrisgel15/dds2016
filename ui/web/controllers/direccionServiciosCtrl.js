function DireccionServicios($stateParams, $state, PoiService){
	this.Poi = PoiService.poiService.getPoi();

	if (!this.Poi){
		$state.go("home");
		return;
	}

	this.direccion = this.Poi.direccion;
	this.servicios = this.Poi.getServicios();
}