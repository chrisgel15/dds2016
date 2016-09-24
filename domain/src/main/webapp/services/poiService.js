poiApp.service('PoiService', function($stateParams, $state, $http)
{
	this.buscarPois = function (Criterios, callback, errorHandler) {
    	$http.post('/home', Criterios).then(callback, errorHandler);    
  	};

});