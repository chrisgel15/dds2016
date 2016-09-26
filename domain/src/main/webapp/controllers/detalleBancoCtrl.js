poiApp.controller('detalleBancoCtrl', function($stateParams, $state, DetallePoi) {

	var self = this;
	self.DetalleBanco = transformarABanco(DetallePoi.data);

	self.zona = self.DetalleBanco.zona;

function transformarABanco(jsonBanco) {
		return Banco.asBanco(jsonBanco);
	}

});

