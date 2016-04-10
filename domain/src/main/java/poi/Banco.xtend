package poi

import org.joda.time.DateTime

class Banco extends GenericPoi {

	override ConsultaDisponibilidad(Poi poi, DateTime horario) {
		var int horaDelDia
		if(esFinDeSemana(horario))	{
		horaDelDia = horario.getHourOfDay()
		return (horaDelDia > 10 ||horaDelDia < 15)
		}
		return false		
	}

	override ConsultaCercania(Poi poi, Poi poi2) {
		throw new UnsupportedOperationException("TODO: auto-generated method stub")
	}

	override BusquedaPorTexto(Poi poi, String texto) {
		throw new UnsupportedOperationException("TODO: auto-generated method stub")
	}

}
