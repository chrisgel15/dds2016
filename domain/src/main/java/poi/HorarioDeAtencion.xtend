package poi

import org.joda.time.DateTime

class HorarioDeAtencion {
	int dia
	int horaInicio
	int horaFin

	new(int dia, int horaInicio, int horaFin) {
		this.dia = dia
		this.horaInicio = horaInicio
		this.horaFin = horaFin
	}

	def boolean EstaDisponible(DateTime DiaYHora) {
		var diaRequerido = DiaYHora.getDayOfWeek()
		var horarioRequerido = DiaYHora.hourOfDay().get()

		diaRequerido == this.dia && (horaFin > horarioRequerido) && (horarioRequerido > horaInicio)
	}

}
