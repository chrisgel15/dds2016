poiApp.service('PoiService', function($stateParams, $state, $http)
{
	this.buscarPois = function (Criterios, callback, errorHandler) {
    	$http.post('/home', Criterios).then(callback, errorHandler);    
  	};

});

poiApp.service('DetallePoiService', function($stateParams, $state, $http)
{
	var self = this;

	self.buscarDetalleById = function($stateParams, callback, errorHandler ) {
  		return $http.get('/detalle/' + $stateParams.id, $stateParams.id).then(callback, errorHandler);
  	};

});


poiApp.service('ReviewService', function($stateParams, $state, $http){
	
	var self = this;

	self.addReview = function(review, $stateParams, callback, errorHandler ) {
		$http.post('/addReview/' + $stateParams.id , review).then(callback, errorHandler);
	};

});

poiApp.service('FavoritoService', function($stateParams, $state, $http){

	var self = this;

	self.favorito = function(favoritear, callback, errorHandler) {
		$http.post('/favorito', favoritear).then(callback, errorHandler);
	};

});