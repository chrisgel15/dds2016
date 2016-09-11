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

poiApp.service('PoiService', function($stateParams, $state) {
	this.poiService = new PoiService($stateParams , $state);
});



poiApp.controller('detalleCtrl', function($stateParams, $state, PoiService) {
	this.detallePoi = new DetallePoi($stateParams, $state, PoiService);
});



poiApp.controller('padreCtrl', function($stateParams, $state, TestService) {
	this.idPadre = $stateParams.id;
	this.datoDelPadre = "Dato del padre...";
	this.variableDeServicioPadre1 = TestService.testService.dameFecha(parseInt($stateParams.id)).valorPor5;
});
poiApp.controller('hijoCtrl', function($stateParams, $state, TestService) {
	this.idHijo = $stateParams.id;
	this.variableDeServicioHijo1 = TestService.testService.dameFecha(parseInt($stateParams.id)).valorMas20;
});

poiApp.service('TestService', function(){
	this.testService = new TestService();
});
poiApp.run(function($rootScope) {
  $rootScope.$on("$stateChangeError", console.log.bind(console));
});

function TestService()
{
		this.dameFecha = function(valor) {
			return new PruebaService(valor);
		};
}

function PruebaService(valor)
{
	this.valorMas20 = parseInt(valor) + 20;
	this.valorPor5 = parseInt(valor) *5;
}