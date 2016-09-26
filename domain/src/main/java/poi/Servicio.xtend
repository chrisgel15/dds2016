package poi

import java.util.ArrayList
import java.util.List
import org.joda.time.DateTime
import org.eclipse.xtend.lib.annotations.Accessors

@Accessors
class Servicio {

	public String nombre
	List<HorarioDeAtencion> horarios

	new(String nom, int dia, int horaInicio, int horaFin) {
		this.nombre = nom
		horarios = new ArrayList<HorarioDeAtencion>()
		this.AgregarHorario(dia, horaInicio, horaFin)
	}
	
	//Se agrega constructor para mapear rangoServicioDTO//
//	new(String nom, List<Integer> rangos){
//		this(nom,rangos.get(0),rangos.get(1),rangos.get(3))
//	}

	new(String nom)
	{
		this.nombre = nom
	}
	
	new(String nom, List<List<Integer>> rangos)
	{
		this(nom)
		horarios = new ArrayList<HorarioDeAtencion>()
		rangos.forEach[ rango | this.AgregarHorario(rango.get(0),rango.get(1),rango.get(2)) ]
	}

	def void AgregarHorario(int dia, int horaInicio, int horaFin) {
		horarios.add(new HorarioDeAtencion(dia, horaInicio, horaFin))
	}
	
	def boolean EstaDisponible(DateTime horario)
	{
		this.horarios.exists[ h | h.EstaDisponible(horario)]
	}
}
