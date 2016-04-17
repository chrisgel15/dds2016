package poi

import org.joda.time.DateTime

class ServicioYHorario {
	val String servicio
	DateTime horario
	
	new(String nombreServicio, DateTime horarioDeAtencion){
		servicio = nombreServicio
		horario = horarioDeAtencion
	}
	
	def DateTime getHorario(){
		this.horario		
	}
	def String  getServicio(){
		this.servicio
	}
}