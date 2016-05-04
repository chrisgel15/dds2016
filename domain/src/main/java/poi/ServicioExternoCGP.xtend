package poi

import java.util.ArrayList
import java.util.List
import org.eclipse.xtend.lib.annotations.Accessors
import org.uqbar.geodds.Point

@Accessors
class ServicioExternoCGP {

	List<CentroDTO> listaDTO = new ArrayList<CentroDTO>()
	List<ServicioDTO> listaServicioDTO = new ArrayList<ServicioDTO>()
	List<RangoServicioDTO> listaRangoDTO = new ArrayList<RangoServicioDTO>()
	List<CGP> pois = new ArrayList<CGP>()
	List<Servicio> servicios = new ArrayList<Servicio>()
	List<HorarioDeAtencion> horarios = new ArrayList<HorarioDeAtencion>()
	List<Integer> rangosDeHoras = new ArrayList<Integer>()
	CGP aux
	Servicio auxServicio
	List<Integer> a
	List<List<Integer>> b

	Point puntoCero

	def List<CGP> BuscarPorTexto(String texto) {
		this.Map(listaDTO)
	// Debe retornar una lista de Pois...
	}

	def List<CGP> Map(List<CentroDTO> dtoCGPs) {
		// Aca se mapea el CentroDTO que viene del servicio externo a nuestro dominio...		
		dtoCGPs.forEach[centro|
			pois.add(mapearCGP(centro))
		]
		return pois
	}

	def mapearCGP(CentroDTO unCentroDTO) {

		aux = CreaCGP(unCentroDTO)
		// Para cada centroDTO crea un CGP y le asigna la lista de servicios//
		(unCentroDTO.serviciosDTO).forEach[servicio|
			aux.AgregaServicio(mapearServicio(servicio))
		]
		return aux
	}
	
	def CreaCGP(CentroDTO unCentroDTO) {
		puntoCero = new Point(0, 0)
		new CGP(new Point(unCentroDTO.coordenadaX, unCentroDTO.coordenadaY), 'CGP' + unCentroDTO.domicilio,
			new Comuna('CGP: ' + unCentroDTO.domicilio, puntoCero, puntoCero, puntoCero))
	}

	def mapearServicio(ServicioDTO unServicioDTO) {
		auxServicio = new Servicio(
			unServicioDTO.nombreServicio,
			mapearDatos(unServicioDTO.rangos)
		)
	}

	def List<List<Integer>> mapearDatos(List<RangoServicioDTO> rangos) {
		b = rangos.map[rango|mapearRango(rango)]
	}

	def List<Integer> mapearRango(RangoServicioDTO unRangoDTO) {
		a = new ArrayList<Integer>()
		a.add(unRangoDTO.numeroDia)
		a.add(unRangoDTO.horarioDesde)
		a.add(unRangoDTO.horarioHasta)
		return a
	}
}
