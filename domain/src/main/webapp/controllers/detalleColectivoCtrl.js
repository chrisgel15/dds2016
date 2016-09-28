

poiApp.controller('detalleColectivoCtrl', function($stateParams, $state, DetallePoi){
	var self = this;

	self.DetalleColectivo = transformarAColectivo(DetallePoi.data);

	function transformarAColectivo(jsonColectivo) {
		return ParadaDeColectivo.asParadaDeColectivo(jsonColectivo);
	}
});