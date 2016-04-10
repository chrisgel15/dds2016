package poi

import org.uqbar.geodds.Point

class ParadaColectivo extends Poi {

	// Referencia una cuadra (0.1 kilometros)
	static double DISTANCIA_PARADA_COLECTIVO = 0.1
	
	new(Point p, String nom) {
		super(p, nom)
	}

	override ConsultaDisponibilidad() {
		throw new UnsupportedOperationException("TODO: auto-generated method stub")
	}

	override ConsultaCercania(Poi destino) {
		this.DistanciaAOtroPoiMenorA(destino, DISTANCIA_PARADA_COLECTIVO)
	}

	override BusquedaPorTexto(String texto) {
		var Poi auxPoi = null
		auxPoi = this.BusquedaPorEtiqueta(this, texto)
		if (auxPoi == null)
			auxPoi = this.BusquedaPorNombre(this, texto)

		return auxPoi
	}
	
	

}
