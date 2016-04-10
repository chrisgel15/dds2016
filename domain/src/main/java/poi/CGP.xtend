package poi

import org.joda.time.DateTime

class CGP extends GenericPoi {

	Comuna comuna

	// Un CGP tiene una referencia a su comuna
	new(Comuna comuna) {
		this.comuna = comuna
	}

	override ConsultaDisponibilidad(Poi poi, DateTime horario) {
		if(esFinDeSemana(horario))	{
		return poi.servicioEstaDisponible(horario)
		}
		return false
	}

	// Para saber si un CGP esta cerca, debe chequear que esté en la misma comuna que el origen.
	override ConsultaCercania(Poi origenTouchMe, Poi destinoCGP) {
		this.comuna.AmbosPuntosPertenecen(origenTouchMe.locacionPropia, destinoCGP.locacionPropia)
	}

	// TODO: Ver de mejorar esto
	override BusquedaPorTexto(Poi poi, String texto) {
		var Poi auxPoi = null
		auxPoi = this.BusquedaPorEtiqueta(poi, texto)
		if (auxPoi == null)
			auxPoi = this.BusquedaPorNombre(poi, texto)

		return auxPoi
	}

}
