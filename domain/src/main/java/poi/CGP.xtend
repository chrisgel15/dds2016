package poi

import org.uqbar.geodds.Point
import org.joda.time.DateTime
import java.util.ArrayList
import java.util.List

class CGP extends Poi {
	Comuna comuna
	List<Servicio> servicios

// Un CGP tiene una referencia a su comuna
	new(Point p, String nombre, Comuna comuna) {
		super(p, nombre)
		this.comuna = comuna
		this.servicios = new ArrayList<Servicio>()
	}
	
	def void AgregaServicio(Servicio s)
	{
		this.servicios.add(s)
	}

//Ingreso un horario sin un valor X, entonces considero que al menos un servicio esta disponible,
// y por ende retorno True, que el CGP esta disponible.	
	override ConsultaDisponibilidad(ServicioYHorario servicioYHorario) {
		return ConsultaDisponibilidadServicio(servicioYHorario.getServicio(),servicioYHorario.getHorario())
	}
	
/// Region Consulta de Disponibilidad
	
	def boolean ConsultaDisponibilidadServicio(String servicio, DateTime horario)
	{
		ExisteServicio(servicio) && this.servicios.findFirst[s | s.nombre == servicio].EstaDisponible(horario)
	}
	
	def Boolean ExisteServicio(String servicio)
	{
		this.servicios.exists[s | s.nombre == servicio] 
	}

// EndRegion Consulta de Disponibilidad
	
	
// Region Busqueda por Texto

	override BusquedaPorTexto(String texto) {
		var Poi auxPoi = null
		auxPoi = BusquedaEtiqueta(texto)
		if (auxPoi == null)
			auxPoi = BusquedaNombre(texto)
		if (auxPoi == null)
			auxPoi = BusquedaServicio(texto)

		return auxPoi
	}
	
	def Poi BusquedaServicio(String texto)
	{
		if (this.servicios.findFirst[s | s.nombre == texto] != null)
			this
	}

// EndRegion Busqueda por Texto


// Region Consulta Cercania

	/*  Para saber si un CGP esta cerca, debe chequear que esté en la misma comuna que el origen(Dispositivo Touch.Me).
		Asumimos que el punto de interés CGP -SIEMPRE- está dentro de la comuna correspondiente
		Sólo interesa saber si el dispositivo TouchMe tambíen está dentro de los límites de la comuna.
	*/
	
	override ConsultaCercania(PoiBase origenTouchMe) {
		this.comuna.PertenecePoint(origenTouchMe.locacionPropia)
	}

// EndRegion Consulta Cercania

}
