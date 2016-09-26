'use strict';
poiApp.controller('detalleComunCtrl', function($stateParams, $state , DetallePoi, ReviewService, UsuariosService) {

	var self = this;

	self.DetallePoiComun = DetallePoi.data;

	self.nombre = self.DetallePoiComun.nombre;
	self.imagenUrl = self.DetallePoiComun.imagenUrl;

	self.addReview = function(){
		ReviewService.addReview( angular.toJson(new Review(UsuariosService.idUsuarioLogueado, "muy bueno!","5")), $stateParams ,
			function() { 
				alert('ok'); }, 
			function(response) {
				alert(response.data); });
	};

});