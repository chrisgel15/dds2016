package poi

import org.joda.time.DateTime

class LibreriaEscolar extends LocalComercial {

	static double DISTANCIA_LIBRERIA_ESCOLAR = 0.5
	
	new(DateTime dispDesde, DateTime dispHasta) {
		super(dispDesde, dispHasta)
	}

	override boolean ConsultaDisponibilidad(Poi poi, DateTime horario) {
		throw new UnsupportedOperationException("TODO: auto-generated method stub")
	}

	override boolean ConsultaCercania(Poi origen, Poi destino) {
		origen.DistanciaAOtroPoiMenorA(destino, DISTANCIA_LIBRERIA_ESCOLAR)
	}

	override BusquedaPorTexto(Poi poi, String texto) {
		throw new UnsupportedOperationException("TODO: auto-generated method stub")
	}

}
