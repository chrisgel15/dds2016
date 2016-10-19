package poi

import org.joda.time.DateTime
import org.eclipse.xtend.lib.annotations.Accessors
import javax.persistence.Entity
import javax.persistence.Column
import javax.persistence.Id
import javax.persistence.GeneratedValue
import javax.persistence.ManyToOne

@Entity
@Accessors
class HorarioDeAtencion {
	@Id
	@GeneratedValue
	private Long id
	@Column
	int dia
	@Column
	int horaInicio
	@Column
	int horaFin
	

	new(int dia, int horaInicio, int horaFin) {
		this.dia = dia
		this.horaInicio = horaInicio
		this.horaFin = horaFin
	}
	
	new(){}

	def boolean EstaDisponible(DateTime DiaYHora) {
		var diaRequerido = DiaYHora.getDayOfWeek()
		var horarioRequerido = DiaYHora.hourOfDay().get()

		diaRequerido == this.dia && (horaFin > horarioRequerido) && (horarioRequerido > horaInicio)
	}

}
