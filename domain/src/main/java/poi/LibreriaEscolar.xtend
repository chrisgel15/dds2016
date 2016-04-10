package poi

class LibreriaEscolar extends LocalComercial {

	static double DISTANCIA_LIBRERIA_ESCOLAR = 0.5

	override ConsultaDisponibilidad() {
		throw new UnsupportedOperationException("TODO: auto-generated method stub")
	}

	override boolean ConsultaCercania(Poi origen, Poi destino) {
		origen.DistanciaAOtroPoiMenorA(destino, DISTANCIA_LIBRERIA_ESCOLAR)
	}

	override BusquedaPorTexto(Poi poi, String texto) {
		throw new UnsupportedOperationException("TODO: auto-generated method stub")
	}

}
