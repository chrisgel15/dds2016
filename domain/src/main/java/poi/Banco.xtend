package poi

import java.util.ArrayList
import java.util.List
import org.uqbar.geodds.Point

class Banco extends Poi {
	List<Servicio> servicios

	new(Point p, String nom) {
		super(p, nom)
		this.servicios = new ArrayList<Servicio>()
	}
	
	def void AgregaServicio(Servicio s)
	{
		this.servicios.add(s)
	}

	override ConsultaDisponibilidad(ServicioYHorario servicioYHorario) {
		this.servicios.get(0).EstaDisponible(servicioYHorario.getHorario())
	}	

	override ConsultaCercania(PoiBase touchMe) {
		super.ConsultaCercania(touchMe)
	}

	override BusquedaPorTexto(String texto) {
		var Poi auxPoi = null
		auxPoi = BusquedaEtiqueta(texto)
		if (auxPoi == null)
			auxPoi = BusquedaNombre(texto)

		return auxPoi
	}

}
