package poi

import java.util.HashSet
import java.util.Set
import javax.persistence.CascadeType
import javax.persistence.Column
import javax.persistence.Entity
import javax.persistence.FetchType
import javax.persistence.OneToMany
import org.eclipse.xtend.lib.annotations.Accessors
import org.uqbar.geodds.Point
import javax.persistence.JoinTable

@Entity
@Accessors
class Banco extends Poi {
	
	@OneToMany(cascade = CascadeType.ALL, orphanRemoval=true, fetch = FetchType.EAGER)
	@JoinTable(name = "banco_servicios")
	Set<Servicio> servicios
	@Column(length = 100)
	String zona
	

	new(Point p, String nom) {
		super(p, nom)
		this.servicios = new HashSet<Servicio>()
		this.tipo = "banco"
		this.zona = ""
	}
	
	new(){}

	def void AgregaServicio(Servicio s) {
		this.servicios.add(s)
	}

	override ConsultaDisponibilidad(ServicioYHorario servicioYHorario) {
		this.servicios.get(0).EstaDisponible(servicioYHorario.getHorario())
	}

	override ConsultaCercania(PuntoBase touchMe) {
		super.ConsultaCercania(touchMe)
	}

	override BusquedaPorTexto(String texto) {
		BusquedaEtiqueta(texto) || BusquedaNombre(texto) || BusquedaDireccion(texto)
	}
	
}
