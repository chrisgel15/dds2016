package poi

import org.uqbar.geodds.Point
import org.joda.time.DateTime

class CGP extends Poi {
	Comuna comuna

// Un CGP tiene una referencia a su comuna
	new(Point p, String nombre, Comuna comuna) {
		super(p, nombre)
		this.comuna = comuna
	}

	override ConsultaDisponibilidad(Poi poi, DateTime horario) {
		if (esFinDeSemana(horario)) {
			return poi.servicioEstaDisponible(horario)
		}
		return false
	}

	def boolean esFinDeSemana(DateTime fecha) {
		var int diaDeLaSemana
		diaDeLaSemana = fecha.getDayOfWeek()
		return (diaDeLaSemana != 6 && diaDeLaSemana != 7)
	}

	// TODO: Ver de mejorar esto
	override BusquedaPorTexto(String texto) {
		var Poi auxPoi = null
		auxPoi = this.BusquedaPorEtiqueta(this, texto)
		if (auxPoi == null)
			auxPoi = this.BusquedaPorNombre(this, texto)

		return auxPoi
	}

	// Para saber si un CGP esta cerca, debe chequear que esté en la misma comuna que el origen.
	override ConsultaCercania(Poi origenTouchMe) {
		this.comuna.AmbosPuntosPertenecen(origenTouchMe.locacionPropia, this.locacionPropia)
	}

}
