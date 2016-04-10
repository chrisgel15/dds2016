package poi

class ParadaColectivo extends GenericPoi {

	// Referencia una cuadra (0.1 kilometros)
	static double DISTANCIA_PARADA_COLECTIVO = 0.1

	override ConsultaDisponibilidad() {
		throw new UnsupportedOperationException("TODO: auto-generated method stub")
	}

	override ConsultaCercania(Poi origen, Poi destino) {
		origen.DistanciaAOtroPoiMenorA(destino, DISTANCIA_PARADA_COLECTIVO)
	}

	override BusquedaPorTexto(Poi poi, String texto) {
		var Poi auxPoi = null
		auxPoi = this.BusquedaPorEtiqueta(poi, texto)
		if (auxPoi == null)
			auxPoi = this.BusquedaPorNombre(poi, texto)

		return auxPoi
	}

}
