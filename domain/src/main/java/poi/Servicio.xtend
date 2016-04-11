package poi

import org.joda.time.DateTime
import org.joda.time.Interval

class Servicio {
	String nombre
	DateTime inicio
	DateTime fin
	Interval intervalo
	
	new(String nom, DateTime dispDesde, DateTime dispHasta) {
		this.nombre = nom
		this.inicio = dispDesde
		this.fin = dispHasta
		intervalo = new Interval(inicio, fin);
	}
	
	new() {
		throw new UnsupportedOperationException("TODO: auto-generated method stub")
	}
	
	def boolean estaDisponible (DateTime horario){
		intervalo.contains(horario)
	}
}