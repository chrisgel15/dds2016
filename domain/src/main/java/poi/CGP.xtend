package poi

import org.uqbar.geodds.Point
import org.joda.time.DateTime
import java.util.ArrayList
import java.util.List
import org.eclipse.xtend.lib.annotations.Accessors
import javax.persistence.Entity
import javax.persistence.OneToOne
import javax.persistence.OneToMany
import javax.persistence.FetchType
import javax.persistence.ManyToOne
import javax.persistence.CascadeType
import java.util.Set
import java.util.HashSet
import javax.persistence.JoinTable

@Entity
@Accessors
class CGP extends Poi {
	@ManyToOne(cascade = CascadeType.ALL, fetch = FetchType.EAGER)
	Comuna comuna
	@OneToMany(cascade = CascadeType.ALL, orphanRemoval=true, fetch = FetchType.EAGER)
	@JoinTable(name = "cgp_servicios")
	Set<Servicio> servicios

// Un CGP tiene una referencia a su comuna
	new(Point p, String nombre, Comuna comuna) {
		super(p, nombre)
		this.comuna = comuna
		this.servicios = new HashSet<Servicio>()
		this.tipo = "cgp"
	}
	
	new(){}

	def void AgregaServicio(Servicio s) {
		this.servicios.add(s)
	}

//Ingreso un horario sin un valor X, entonces considero que al menos un servicio esta disponible,
// y por ende retorno True, que el CGP esta disponible.	
	override ConsultaDisponibilidad(ServicioYHorario servicioYHorario) {
		return ConsultaDisponibilidadServicio(servicioYHorario.getServicio(), servicioYHorario.getHorario())
	}

/// Region Consulta de Disponibilidad
	def boolean ConsultaDisponibilidadServicio(String servicio, DateTime horario) {
		ExisteServicio(servicio) && this.servicios.findFirst[s|s.nombre == servicio].EstaDisponible(horario)
	}

	def Boolean ExisteServicio(String servicio) {
		this.servicios.exists[s|s.nombre == servicio]
	}

// EndRegion Consulta de Disponibilidad
// Region Busqueda por Texto
	override BusquedaPorTexto(String texto) {
		BusquedaEtiqueta(texto) || BusquedaNombre(texto) || BusquedaServicio(texto) || BusquedaDireccion(texto)
	}

	def boolean BusquedaServicio(String texto) {
		this.servicios.exists[s|StringHelper.ComparaStrings(s.nombre, texto)]
	}

// EndRegion Busqueda por Texto
// Region Consulta Cercania
	/*  Para saber si un CGP esta cerca, debe chequear que esté en la misma comuna que el origen(Dispositivo Touch.Me).
	 * 	Asumimos que el punto de interés CGP -SIEMPRE- está dentro de la comuna correspondiente
	 * 	Sólo interesa saber si el dispositivo TouchMe tambíen está dentro de los límites de la comuna.
	 */
	override ConsultaCercania(PuntoBase origenTouchMe) {
		this.comuna.PertenecePoint(origenTouchMe.localizacionPropia)
	}

// EndRegion Consulta Cercania
}
