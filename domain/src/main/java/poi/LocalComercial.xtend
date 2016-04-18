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

	def boolean BusquedaRubro(String texto) {
		StringHelper.ComparaStrings(this.rubro, texto)
	}

	override BusquedaPorTexto(String texto) {
		BusquedaEtiqueta(texto) || BusquedaNombre(texto) || BusquedaRubro(texto)
	}

}
