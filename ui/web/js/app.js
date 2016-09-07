'use strict';
var poiApp = angular.module("poiApp", ['ui.router']);

poiApp.controller('buscadorCtrl', function($stateParams, $state, PoiService) {
	this.buscadorPois = new BuscadorPois($stateParams, $state, PoiService);
});

poiApp.controller('detalleCtrl', function($stateParams, $state, PoiService) {
	this.detallePoi = new DetallePoi($stateParams, $state, PoiService);
});

poiApp.controller('detalleColectivoCtrl', function($stateParams, $state, PoiService) {
	this.detalleColectivo = new DetalleColectivo($stateParams, $state, PoiService);
});

poiApp.controller('detalleBancoCtrl', function($stateParams, $state, PoiService) {
	this.detalleBanco = new DetalleBanco($stateParams, $state, PoiService);
});

poiApp.service('PoiService', function() {
	this.poiService = new PoiService();
});
