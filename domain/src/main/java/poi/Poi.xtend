
package poi

import com.fasterxml.jackson.annotation.JsonIgnoreProperties
import java.util.ArrayList
import java.util.List
import org.eclipse.xtend.lib.annotations.Accessors
import org.uqbar.commons.utils.Observable
import org.uqbar.geodds.Point

@JsonIgnoreProperties("localizacionPropia", "etiquetas")
@Observable
@Accessors
class Poi extends PuntoBase {

	// Referencia 5 cuadras (0.5 kilometros)
	static double DISTANCIA_MINIMA_GENERAL = 0.5
	
	String direccion	
	String imagenUrl
	List<String> etiquetas
	String tipo // Se utiliza para que viaje el tipo por JSON. TODO: Utilizar annotations

	def setEtiqueta(String etiqueta) {
		this.etiquetas.add(etiqueta)
	}
	def setEtiquetas(List<String> etiquetas){
		etiquetas.forEach[etiqueta | this.setEtiqueta(etiqueta) ]
	}
	new(Point p, String nom) {
		super(p, nom)
		this.etiquetas = new ArrayList()
		this.direccion = ""
	}

	def ConsultaCercania(PuntoBase destino) {
		this.DistanciaEsMenorA(destino, DISTANCIA_MINIMA_GENERAL)
	}

	def DistanciaEsMenorA(PuntoBase destino, double distancia) {
		DistanciaEntrePuntos(destino) < distancia
	}

	def private DistanciaEntrePuntos(PuntoBase destino) {
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
	
	def boolean BusquedaDireccion(String direccion) {
		ContieneDireccion(direccion)
	}
	
	def ContieneDireccion(String direccion) {
		StringHelper.ComparaStrings(this.direccion, direccion)
	}
	
	def boolean ConsultaDisponibilidad(ServicioYHorario servicioYHorario) {
		throw new UnsupportedOperationException("No implementado en la clase base. Debe redefinirse")
	}
	
	def boolean BusquedaPorTexto(String texto) {
		throw new UnsupportedOperationException("No implementado en la clase base. Debe redefinirse")
	}

}

