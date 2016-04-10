package poi

import org.joda.time.DateTime

class LibreriaEscolar extends LocalComercial {

	static double DISTANCIA_LIBRERIA_ESCOLAR = 0.5
	
	new(DateTime dispDesde, DateTime dispHasta, String rubro) {
		super(dispDesde, dispHasta)
		this.rubro = rubro
	}

	override boolean ConsultaDisponibilidad(Poi poi, DateTime horario) {
		throw new UnsupportedOperationException("TODO: auto-generated method stub")
	}

	override boolean ConsultaCercania(Poi origen, Poi destino) {
		origen.DistanciaAOtroPoiMenorA(destino, DISTANCIA_LIBRERIA_ESCOLAR)
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

}
