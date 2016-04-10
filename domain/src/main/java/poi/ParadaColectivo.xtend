package poi

class ParadaColectivo implements IUbicable {
	
	// Referencia una cuadra (0.1 kilometros)
	static double DISTANCIA_PARADA_COLECTIVO = 0.1

	override ConsultaDisponibilidad() {
		throw new UnsupportedOperationException("TODO: auto-generated method stub")
	}

	override BusquedaPorCriterio() {
		throw new UnsupportedOperationException("TODO: auto-generated method stub")
	}

	override ConsultaCercania(Poi origen, Poi destino) {
		origen.DistanciaAOtroPoiMenorA(destino , DISTANCIA_PARADA_COLECTIVO)
	}

}
