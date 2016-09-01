'use strict';
var poiApp = angular.module("poiApp", []);

poiApp.controller('buscadorCtrl', function() {
	this.buscadorPois = new BuscadorPois();
});


