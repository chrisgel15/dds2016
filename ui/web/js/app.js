'use strict';
var poiApp = angular.module("poiApp", ['ui.router']);

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

poiApp.controller('direccionServiciosCtrl', function($stateParams, $state, PoiService){
	this.direccionServicios = new DireccionServicios($stateParams, $state, PoiService);
});

poiApp.controller('horariosCgpCtrl', function($stateParams, $state, PoiService){
	this.horariosCgp = new HorariosCgp($stateParams, $state, PoiService);
});

poiApp.service('PoiService', function($stateParams, $state) {
	this.poiService = new PoiService($stateParams , $state);
});





