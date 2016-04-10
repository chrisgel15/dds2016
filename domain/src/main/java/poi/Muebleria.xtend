package poi

import org.joda.time.DateTime

class Muebleria extends LocalComercial {	

	
	new(DateTime dispDesde, DateTime dispHasta) {
		super(dispDesde, dispHasta)
	}
	
	override BusquedaPorTexto(Poi poi, String texto) {
		var Poi auxPoi = null
		auxPoi = this.BusquedaPorEtiqueta(poi, texto)
		if (auxPoi == null)
			auxPoi = this.BusquedaPorNombre(poi, texto)
		if (auxPoi == null)
			auxPoi = this.BusquedaPorRubro(poi, texto)

		return auxPoi
	}
	
	override ConsultaDisponibilidad(Poi poi, DateTime horario) {
		throw new UnsupportedOperationException("TODO: auto-generated method stub")
	}

}
