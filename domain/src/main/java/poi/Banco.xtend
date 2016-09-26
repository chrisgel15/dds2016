package poi

import java.util.ArrayList
import java.util.List
import org.eclipse.xtend.lib.annotations.Accessors
import org.uqbar.geodds.Point

@Accessors
class Banco extends Poi {
	
	List<Servicio> servicios
	String zona
	

	new(Point p, String nom) {
		super(p, nom)
		this.servicios = new ArrayList<Servicio>()
		this.tipo = "banco"
		this.zona = ""
	}

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
