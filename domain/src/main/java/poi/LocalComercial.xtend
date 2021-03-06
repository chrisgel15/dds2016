package poi

import java.util.ArrayList
import java.util.List
import org.uqbar.geodds.Point

class LocalComercial extends Poi {

	protected List<HorarioDeAtencion> horarios
	private IRubro rubro
	private List<String> palabrasClave

	new(Point p, String nom, HorarioDeAtencion horario, IRubro rubro) {
		super(p, nom)
		this.rubro = rubro
		horarios = new ArrayList<HorarioDeAtencion>()
		horarios.add(horario)
		palabrasClave = new ArrayList<String>()
		this.tipo = "localComercial"
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
		StringHelper.ComparaStrings(this.rubro.nombre, texto)
	}

	override BusquedaPorTexto(String texto) {
		BusquedaEtiqueta(texto) || BusquedaNombre(texto) || BusquedaRubro(texto) || BusquedaDireccion(texto)
	}
	

	override boolean ConsultaCercania(PuntoBase destino) {
		this.DistanciaEsMenorA(destino, this.rubro.radioCercania)
	}
	def void anadirPalabrasClave(List<String> palabras){
		palabras.forEach[palabra | palabrasClave.add(palabra)] 
	}
}
