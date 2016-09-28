'use strict';
poiApp.controller('detalleComunCtrl', function($stateParams, $state , DetallePoi, ReviewService, UsuariosService, FavoritoService) {

	var self = this;

	self.DetallePoiComun = DetallePoi.data;

	self.DetallePoiComunObject = Poi.asPoi(self.DetallePoiComun);

	self.nombre = self.DetallePoiComun.nombre;
	self.imagenUrl = self.DetallePoiComun.imagenUrl;
	self.opinion = "";
	self.puntaje = 0;
	self.reviewOk = "";
	self.reviewError = "";
	self.mensaje = "";
	self.listaReviews = _.map(self.DetallePoiComun.reviews, transformarAReview);

	self.notaPromedio = self.DetallePoiComunObject.CalcularPromedio(self.listaReviews);

	// Marca el Poi como favorito o no.
	self.DetallePoiComunObject.marcarFavorito(UsuariosService.favoritosId);

	self.valueFavorito = self.DetallePoiComunObject.esFavorito;

	self.addReview = function(){
		ReviewService.addReview( angular.toJson(new Review(UsuariosService.idUsuarioLogueado, self.opinion,
									self.puntaje, UsuariosService.usuarioLogueado)), $stateParams ,
			function(response){
				self.reviewOk = true;
				self.reviewError = false;
				self.mensaje = "Review enviada con exito";
				self.listaReviews = _.map(response.data, transformarAReview);
				self.notaPromedio = self.DetallePoiComunObject.CalcularPromedio(self.listaReviews);
				console.log(self.listaReviews);
			},	 
			function() {
				self.reviewError = true;
				self.reviewOk = false;
				self.mensaje = "Solo puede enviar una review para este POI"; 
			}
				);
	};

	self.favorito = function() {
		FavoritoService.favorito( { 'idUsuario':UsuariosService.idUsuarioLogueado, 
			'idPoi':self.DetallePoiComun.id },
			function() { 
				UsuariosService.usuarioObject.marcarFavorito(self.DetallePoiComun.id);
				self.reviewOk = true;
				self.reviewError = false;
				self.mensaje = "Su selección fue guardada con éxito.";
			 },
			function() { self.reviewError = true;
				self.reviewOk = false;
				self.mensaje = "Hubo un error al intentar guardar su selección."; 
				 } );

	};

	function transformarAReview(jsonReview) {
		return Review.asReview(jsonReview);
	}



});