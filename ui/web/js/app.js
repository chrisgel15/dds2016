'use strict';
var poiApp = angular.module("poiApp", ['ui.router']);

poiApp.controller('loginCtrl', function($stateParams, $state) {
	//this.buscadorPois = new BuscadorPois($stateParams, $state, PoiService);
	this.login = function(){
		$state.go("home");
	};
});

/*poiApp.controller('loginCtrl', function($stateParams, $state, UsuariosService) {
	this.login = new ValidarUsuario($stateParams, $state, UsuariosService);
});*/

poiApp.controller('buscadorCtrl', function($stateParams, $state, PoiService) {
	this.buscadorPois = new BuscadorPois($stateParams, $state, PoiService);
});

poiApp.controller('detalleComunCtrl', function($stateParams, $state , PoiService){
	this.detalleComun = new DetalleComun($stateParams, $state , PoiService);
});

poiApp.controller('detalleColectivoCtrl', function($stateParams, $state, PoiService) {
	this.detalleColectivo = new DetalleColectivo($stateParams, $state, PoiService);
});

poiApp.controller('detalleBancoCtrl', function($stateParams, $state, PoiService) {
	this.detalleBanco = new DetalleBanco($stateParams, $state, PoiService);
});

poiApp.controller('detalleCgpCtrl', function($stateParams, $state, PoiService) {
	this.detalleCgp = new DetalleCgp($stateParams, $state, PoiService);
});

poiApp.controller('direccionServiciosCtrl', function($stateParams, $state, PoiService, MostrarHorario){
	this.direccionServicios = new DireccionServicios($stateParams, $state, PoiService, MostrarHorario);
});

poiApp.service('PoiService', function($stateParams, $state) {
	this.poiService = new PoiService($stateParams , $state);
});




