package poi

import org.uqbar.geodds.Point

class Poi {

	Point localizacionPropia
	String nombre
	// Direccion direccion
	IUbicable estrategia

	new(Point p, String nom) {
		this.localizacionPropia = p
		this.nombre = nom
	}

	def DistanciaAOtroPoiMenorA(Poi destino, double distancia) {
		DistanciaEntrePuntos(destino) < distancia
	}

	def private DistanciaEntrePuntos(Poi destino) {
		Haversine.distance(localizacionPropia.latitude, localizacionPropia.longitude,
			destino.localizacionPropia.latitude, destino.localizacionPropia.longitude)
	}

	def EsValido() {
		!(localizacionPropia == null && nombre.isNullOrEmpty())
	}

	def DefinirTipoDePoi(IUbicable tipoPoi) {
		this.estrategia = tipoPoi
	}

	def ConsultaCercania(Poi origen) {
		// origen, destino
		this.estrategia.ConsultaCercania(origen, this)
	}

	def getLocacionPropia() {
		localizacionPropia
	}

}
