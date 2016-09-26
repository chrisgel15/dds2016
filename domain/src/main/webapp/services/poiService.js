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