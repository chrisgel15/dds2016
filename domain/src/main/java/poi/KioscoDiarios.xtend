package poi

import org.uqbar.geodds.Point

class KioscoDiarios extends LocalComercial {

	static double DISTANCIA_KIOSCO_DIARIOS = 0.2

	new(Point p, String nom) {
		super(p, nom)
	}

	override ConsultaDisponibilidad() {
		throw new UnsupportedOperationException("TODO: auto-generated method stub")
	}

	override boolean ConsultaCercania(Poi destino) {
		this.DistanciaAOtroPoiMenorA(destino, DISTANCIA_KIOSCO_DIARIOS)
	}

	override BusquedaPorTexto(String texto) {
		super.BusquedaPorTexto(texto)
	}

}
