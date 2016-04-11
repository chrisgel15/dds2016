package poi

import org.uqbar.geodds.Point
import java.util.List
import java.util.ArrayList
import org.joda.time.DateTime

abstract class Poi implements IUbicable {

	Point localizacionPropia
	String nombre
	// Direccion direccion
	List<String> etiquetas
	Servicio servicio

	// region Getters y Setters	
	def getLocacionPropia() {
		localizacionPropia
	}

	def getEtiquetas() {
		this.etiquetas
	}

	def setEtiqueta(String etiqueta) {
		this.etiquetas.add(etiqueta)
	}

	// endregion Getters y Setters
	// region Constructores
	new(Point p, String nom) {
		this.localizacionPropia = p
		this.nombre = nom
		this.etiquetas = new ArrayList()
	}

	// endregion Constructores
	// region Methods	
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

	def BusquedaEtiqueta(String etiqueta) {
		if (ContieneEtiqueta(etiqueta))
			this
		else
			null
	}

	def private ContieneEtiqueta(String etiqueta) {
		this.etiquetas.exists [ element |
			this.ComparaStrings(element, etiqueta)
		]
	}

	def BusquedaNombre(String nombre) {
		if (ContieneNombre(nombre))
			this
		else
			null
	}

	def private ContieneNombre(String nombre) {
		this.ComparaStrings(this.nombre, nombre)
	}

	def ComparaStrings(String string1, String string2) {
		string1.toLowerCase().contains(string2.toLowerCase()) || string2.toLowerCase().contains(string1.toLowerCase())
	}

	def Poi BusquedaPorEtiqueta(Poi poi, String etiqueta) {
		poi.BusquedaEtiqueta(etiqueta)
	}

	def Poi BusquedaPorNombre(Poi poi, String nombre) {
		poi.BusquedaNombre(nombre)
	}

	def boolean servicioEstaDisponible(DateTime horario) {
		this.servicio.estaDisponible(horario)
	}
// endregion Methods
}
