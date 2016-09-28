poiApp.controller('detalleCgpCtrl', function($stateParams, $state, DetallePoi) {

var self = this;

self.DetalleCgp = transformarACgp(DetallePoi.data);

	self.zona = self.DetalleCgp.comuna.nombre;

function transformarACgp(jsonCgp) {
		return CGP.asCgp(jsonCgp);
	}

//	this.comuna = this.Poi.comuna;

});




