package poi

import java.util.ArrayList
import java.util.List
import org.uqbar.geodds.Point

abstract class Poi extends PuntoBase {

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

	def ConsultaCercania(PoiBase destino) {
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
		ContieneEtiqueta(etiqueta)
	}

	def private ContieneEtiqueta(String etiqueta) {
		this.etiquetas.exists[element|StringHelper.ComparaStrings(element, etiqueta)]
	}

	def boolean BusquedaNombre(String nombre) {
		ContieneNombre(nombre)
	}

	def ContieneNombre(String nombre) {
		StringHelper.ComparaStrings(this.nombre, nombre)
	}
	
	def boolean ConsultaDisponibilidad(ServicioYHorario servicioYHorario) {
		throw new UnsupportedOperationException("No implementado en la clase base. Debe redefinirse")
	}
	
	def boolean BusquedaPorTexto(String texto) {
		throw new UnsupportedOperationException("No implementado en la clase base. Debe redefinirse")
	}

}
