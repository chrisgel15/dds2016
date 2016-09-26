poiApp.controller('direccionServiciosCtrl', function($stateParams, $state, DetallePoi, MostrarHorario){

	var self = this;

self.direccion = DetallePoi.data.direccion;
self.servicios = DetallePoi.data.servicios;
self.mostrarHorarios = MostrarHorario.mostrar;


});