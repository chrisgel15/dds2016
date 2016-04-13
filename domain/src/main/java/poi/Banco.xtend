package poi

import org.uqbar.geodds.Point
import org.joda.time.DateTime
import java.util.List
import java.util.ArrayList

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

	override ConsultaDisponibilidad(DateTime horario) {
		this.servicios.get(0).EstaDisponible(horario)
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
