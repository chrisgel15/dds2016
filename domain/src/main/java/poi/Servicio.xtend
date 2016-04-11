package poi

import java.util.ArrayList
import java.util.List
import org.joda.time.DateTime

class Servicio {

	public String nombre
	List<HorarioDeAtencion> horarios

	new(String nom, int dia, int horaInicio, int horaFin) {
		this.nombre = nom
		horarios = new ArrayList<HorarioDeAtencion>()
		this.AgregarHorario(dia, horaInicio, horaFin)
	}

	def void AgregarHorario(int dia, int horaInicio, int horaFin) {
		horarios.add(new HorarioDeAtencion(dia, horaInicio, horaFin))
	}
	
	def boolean EstaDisponible(DateTime horario)
	{
		this.horarios.exists[ h | h.EstaDisponible(horario)]
	}
}
