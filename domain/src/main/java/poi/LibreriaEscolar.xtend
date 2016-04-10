package poi

class LibreriaEscolar extends LocalComercial {

	static double DISTANCIA_LIBRERIA_ESCOLAR = 0.5
	
	new (String rubro)
	{
		this.rubro = rubro
	}

	override ConsultaDisponibilidad() {
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
