package poi

class KioscoDiarios extends LocalComercial {

	static double DISTANCIA_KIOSCO_DIARIOS = 0.2

	override ConsultaDisponibilidad() {
		throw new UnsupportedOperationException("TODO: auto-generated method stub")
	}

	override BusquedaPorCriterio() {
		throw new UnsupportedOperationException("TODO: auto-generated method stub")
	}

	override boolean ConsultaCercania(Poi origen, Poi destino) {
		origen.DistanciaAOtroPoiMenorA(destino, DISTANCIA_KIOSCO_DIARIOS)
	}

}
