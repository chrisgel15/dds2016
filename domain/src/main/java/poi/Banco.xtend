package poi

import org.uqbar.geodds.Point
import org.joda.time.DateTime

class Banco extends Poi {

	new(Point p, String nom) {
		super(p, nom)
	}

	override ConsultaDisponibilidad(Poi poi, DateTime horario) {
		var int horaDelDia
		if (esFinDeSemana(horario)) {
			horaDelDia = horario.getHourOfDay()
			return (horaDelDia > 10 || horaDelDia < 15)
		}
		return false

	}

	def boolean esFinDeSemana(DateTime fecha) {
		var int diaDeLaSemana
		diaDeLaSemana = fecha.getDayOfWeek()
		return (diaDeLaSemana != 6 && diaDeLaSemana != 7)
	}

	override ConsultaCercania(Poi origen) {
		throw new UnsupportedOperationException("TODO: auto-generated method stub")
	}

	override BusquedaPorTexto(String texto) {
		throw new UnsupportedOperationException("TODO: auto-generated method stub")
	}

}
