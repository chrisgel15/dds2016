package poi

import java.util.ArrayList
import java.util.List
import org.uqbar.geodds.Point

abstract class Poi implements IUbicable {

	// Referencia 5 cuadras (0.5 kilometros)
	static double DISTANCIA_MINIMA_GENERAL = 0.5

	Point localizacionPropia
	String nombre
	List<String> etiquetas

	def getLocacionPropia() {
		localizacionPropia
	}

	def getEtiquetas() {
		this.etiquetas
	}

	def setEtiqueta(String etiqueta) {
		this.etiquetas.add(etiqueta)
	}

	new(Point p, String nom) {
		this.localizacionPropia = p
		this.nombre = nom
		this.etiquetas = new ArrayList()
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

	override ConsultaCercania(Poi destino) {
		this.DistanciaAOtroPoiMenorA(destino, DISTANCIA_MINIMA_GENERAL)
	}

	def BusquedaEtiqueta(String etiqueta) {
		if (ContieneEtiqueta(etiqueta))
			this
		else
			null
	}

	def private ContieneEtiqueta(String etiqueta) {
		this.etiquetas.exists[element|StringHelper.ComparaStrings(element, etiqueta)]
	}

	def BusquedaNombre(String nombre) {
		if (ContieneNombre(nombre))
			this
		else
			null
	}

	def ContieneNombre(String nombre) {
		StringHelper.ComparaStrings(this.nombre, nombre)
	}

}
