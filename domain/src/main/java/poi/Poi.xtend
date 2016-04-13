package poi

import java.util.ArrayList
import java.util.List
import org.uqbar.geodds.Point

abstract class Poi extends PoiBase implements IUbicable {

	// Referencia 5 cuadras (0.5 kilometros)
	static double DISTANCIA_MINIMA_GENERAL = 0.5

	List<String> etiquetas

	def getEtiquetas() {
		this.etiquetas
	}

	def setEtiqueta(String etiqueta) {
		this.etiquetas.add(etiqueta)
	}

	new(Point p, String nom) {
		super(p, nom)
		this.etiquetas = new ArrayList()
	}

	override ConsultaCercania(PoiBase destino) {
		this.DistanciaEsMenorA(destino, DISTANCIA_MINIMA_GENERAL)
	}

	def DistanciaEsMenorA(PoiBase destino, double distancia) {
		DistanciaEntrePuntos(destino) < distancia
	}

	def private DistanciaEntrePuntos(PoiBase destino) {
		Haversine.distance(this.localizacionPropia.latitude, this.localizacionPropia.longitude,
			destino.localizacionPropia.latitude, destino.localizacionPropia.longitude)
	}

	def EsValido() {
		!(localizacionPropia == null && nombre.isNullOrEmpty())
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
