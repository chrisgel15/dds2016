
package poi

import com.fasterxml.jackson.annotation.JsonIgnoreProperties
import java.util.ArrayList
import java.util.List
import org.eclipse.xtend.lib.annotations.Accessors
import org.uqbar.commons.utils.Observable
import org.uqbar.geodds.Point
import javax.persistence.Entity
import javax.persistence.Column
import javax.persistence.Id
import javax.persistence.GeneratedValue
import javax.persistence.OneToMany
import javax.persistence.FetchType
import javax.persistence.ElementCollection
import javax.persistence.Inheritance
import java.util.HashSet
import java.util.Set
import javax.persistence.CascadeType

@JsonIgnoreProperties("localizacionPropia", "etiquetas")
@Observable
@Entity
@Inheritance(strategy=SINGLE_TABLE)
@Accessors
class Poi extends PuntoBase {

	// Referencia 5 cuadras (0.5 kilometros)
	static double DISTANCIA_MINIMA_GENERAL = 0.5
	
	@Id
	@GeneratedValue
	private Long id
	
	@Column(length=150)
	String direccion
		
	@Column
	String imagenUrl
	
	@ElementCollection
	List<String> etiquetas
	
	@Column(length=150)
	String tipo // Se utiliza para que viaje el tipo por JSON. TODO: Utilizar annotations
	
//	@Column
//	Integer Identificador
	
	@OneToMany(cascade = CascadeType.ALL, fetch=FetchType.EAGER)
	Set<Review> reviews

	def setEtiqueta(String etiqueta) {
		this.etiquetas.add(etiqueta)
	}
	def setEtiquetas(List<String> etiquetas){
		etiquetas.forEach[etiqueta | this.setEtiqueta(etiqueta) ]
	}
	new(Point p, String nom) {
		//super(p, nom)
		this.localizacionPropia = p
		this.nombre = nom
		this.etiquetas = new ArrayList()
		this.direccion = ""
		this.reviews = new HashSet<Review>()
	}
	
	new(){
		
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
	
	// TODO: Ver si eliminando estas lineas sigue funcionando con el otro repo...
	def void AgregarReview(Review rev)
	{
	//	if (!this.reviews.exists[ r | r.equals(rev) ])
			this.reviews.add(rev)
	//	else
		//	throw(new Exception("El usuario ya ha agregado comentarios."))
	}

}

