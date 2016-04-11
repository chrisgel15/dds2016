package poi

import org.uqbar.geodds.Point
import org.joda.time.DateTime

class ParadaColectivo extends Poi {

	// Referencia una cuadra (0.1 kilometros)
	static double DISTANCIA_PARADA_COLECTIVO = 0.1
	
	new(Point p, String nom) {
		super(p, nom)
	}

// El servicio de colectivos siempre esta disponible
	override boolean ConsultaDisponibilidad(DateTime horario) {
		return true
	}

	override ConsultaCercania(Poi destino) {
		this.DistanciaAOtroPoiMenorA(destino, DISTANCIA_PARADA_COLECTIVO)
	}

	override BusquedaPorTexto(String texto) {
		var Poi auxPoi = null
		auxPoi = BusquedaEtiqueta(texto)
		if (auxPoi == null)
			auxPoi = BusquedaNombre(texto)

		return auxPoi
	}
	
	

}
