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
	self.mensaje = "";
	self.listaReviews = _.map(self.DetallePoiComun.reviews, transformarAReview);

	// Marca el Poi como favorito o no.
	self.DetallePoiComunObject.marcarFavorito(UsuariosService.favoritosId);

	self.valueFavorito = self.DetallePoiComunObject.esFavorito;

	self.addReview = function(){
		ReviewService.addReview( angular.toJson(new Review(UsuariosService.idUsuarioLogueado, self.opinion,
									self.puntaje, UsuariosService.usuarioLogueado)), $stateParams ,
			function(response){
				self.reviewOk = true;
				self.mensaje = "Review enviada con exito";
				self.listaReviews = _.map(response.data, transformarAReview);
				console.log(self.listaReviews);
			},	 
			function() {
				self.reviewOk = "";
				self.mensaje = "Solo puede enviar una review para este POI"; 
			}
				);
	};

	self.favorito = function() {
		FavoritoService.favorito( { 'idUsuario':UsuariosService.idUsuarioLogueado, 
			'idPoi':self.DetallePoiComun.id },
			function() { 
				alert('ok');
				//self.DetallePoiComunObject.marcarFavorito(UsuariosService.favoritosId);
				UsuariosService.usuarioObject.marcarFavorito(self.DetallePoiComun.id);
			 },
			function() { alert('error'); } );

	};

	function transformarAReview(jsonReview) {
		return Review.asReview(jsonReview);
	}

});