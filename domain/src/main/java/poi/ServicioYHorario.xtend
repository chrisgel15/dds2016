package poi

import org.joda.time.DateTime
import org.eclipse.xtend.lib.annotations.Accessors

@Accessors
class ServicioYHorario {
	val String servicio
	DateTime horario
	
	new(String nombreServicio, DateTime horarioDeAtencion){
		servicio = nombreServicio
		horario = horarioDeAtencion
	}

}