'use strict';
poiApp.controller('detalleComunCtrl', function($stateParams, $state , DetallePoi, ReviewService, UsuariosService) {

	var self = this;

	self.DetallePoiComun = DetallePoi.data;

	self.nombre = self.DetallePoiComun.nombre;
	self.imagenUrl = self.DetallePoiComun.imagenUrl;
	self.opinion = "";
	self.puntaje = 0;
	self.reviewOk = "";
	self.mensaje = "";
	self.listaReviews = _.map(self.DetallePoiComun.reviews, transformarAReview);

	self.addReview = function(){
		ReviewService.addReview( angular.toJson(new Review(UsuariosService.idUsuarioLogueado, self.opinion,self.puntaje)), $stateParams ,
			//function() { 
				//alert('ok'); },
			function(response){
				self.reviewOk = true;
				self.mensaje = "Review enviada con exito";
				self.listaReviews = _.map(response.data, transformarAReview);
				console.log(self.listaReviews);
			},	 
			function() {
				//alert(response.data);
				self.reviewOk = "";
				self.mensaje = "Solo puede enviar una review para este POI"; 
			}
				);
	};

	function transformarAReview(jsonReview) {
		return Review.asReview(jsonReview);
	}

});