package poi

import java.util.ArrayList
import java.util.List
import org.eclipse.xtend.lib.annotations.Accessors
import org.uqbar.geodds.Point

@Accessors
class AdapterCGP {
	
	List<CGP> pois = new ArrayList<CGP>()
	List<CentroDTO> listaDTO = new ArrayList<CentroDTO>()
	List<ServicioDTO> listaServicioDTO = new ArrayList<ServicioDTO>()
	List<RangoServicioDTO> listaRangoDTO = new ArrayList<RangoServicioDTO>()
	List<Integer> diaYHorarios
	List<List<Integer>> diasYHorariosDeUnServicio
	CGP aux
	Point puntoCero
	Servicio auxServicio
	
	def List<CGP> adaptarCGP(List<CentroDTO> dtoCGPs){
		dtoCGPs.forEach[centro|
			pois.add(mapearCGP(centro))
		]
		return pois
	}
	
	def mapearCGP(CentroDTO unCentroDTO) {
		aux = CreaCGP(unCentroDTO)
		// Para cada centroDTO crea un CGP y le asigna la lista de servicios//
		(unCentroDTO.serviciosDTO).forEach [ servicio |
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
		// Para cada servicio, se mapean su lista de dias y horarios.
		auxServicio = new Servicio(unServicioDTO.nombreServicio,
			mapearDatos(unServicioDTO.rangos))
	}

	def List<List<Integer>> mapearDatos(List<RangoServicioDTO> rangos) {
		diasYHorariosDeUnServicio = rangos.map[rango|mapearRango(rango)]
	}

	def List<Integer> mapearRango(RangoServicioDTO unRangoDTO) {
		diaYHorarios = new ArrayList<Integer>()
		diaYHorarios.add(unRangoDTO.numeroDia)
		diaYHorarios.add(unRangoDTO.horarioDesde)
		diaYHorarios.add(unRangoDTO.horarioHasta)
		return diaYHorarios
	}
}