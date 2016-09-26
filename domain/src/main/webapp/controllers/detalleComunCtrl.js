'use strict';
poiApp.controller('detalleComunCtrl', function($stateParams, $state , DetallePoi) {

	var self = this;

	self.DetallePoiComun = DetallePoi.data;

	self.nombre = self.DetallePoiComun.nombre;
	self.imagenUrl = self.DetallePoiComun.imagenUrl;

});