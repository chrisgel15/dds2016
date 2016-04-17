package poi

import java.util.ArrayList
import java.util.List
import org.uqbar.geodds.Point

abstract class LocalComercial extends Poi {

	protected List<HorarioDeAtencion> horarios
	protected String rubro

	new(Point p, String nom, HorarioDeAtencion horario, String rubro) {
		super(p, nom)
		this.rubro = rubro
		horarios = new ArrayList<HorarioDeAtencion>()
		horarios.add(horario)
	}
	
/* 	def void AgregarHorario(int dia, int horaInicio, int horaFin) {
		horarios.add(new HorarioDeAtencion(dia, horaInicio, horaFin))
	}
*/
	def void AgregarHorario(HorarioDeAtencion horario) {
		horarios.add(horario)
	}
	
	def void AgregarHorarios(int diaInicial, int diaFinal, int horaInicio, int horaFin){
		var int i = diaInicial
		while(i<=diaFinal){
			horarios.add(new HorarioDeAtencion(i++,horaInicio,horaFin))
		}
		
	}
	override boolean ConsultaDisponibilidad(ServicioYHorario servicioYHorario) {
		this.horarios.exists[ element | element.EstaDisponible(servicioYHorario.getHorario()) ]
	}

	def Poi BusquedaRubro(String texto) {
		if (StringHelper.ComparaStrings(this.rubro, texto))
			return this
		else
			return null
	}

	override BusquedaPorTexto(String texto) {
		var Poi auxPoi = null
		auxPoi = BusquedaEtiqueta(texto)
		if (auxPoi == null)
			auxPoi = BusquedaNombre(texto)
		if (auxPoi == null)
			auxPoi = BusquedaRubro(texto)

		return auxPoi
	}

}
