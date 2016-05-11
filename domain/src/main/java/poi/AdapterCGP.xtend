package poi

import java.util.ArrayList
import java.util.List
import org.eclipse.xtend.lib.annotations.Accessors
import org.uqbar.geodds.Point

@Accessors
class AdapterCGP {
	
	def List<CGP> adaptarCGP(List<CentroDTO> dtoCGPs){
		val List<CGP> pois = new ArrayList<CGP>()
		dtoCGPs.forEach[centro|
			pois.add(mapearCGP(centro))
		]
		return pois
	}
	
	// Para cada centroDTO crea un CGP y le asigna la lista de servicios//
	def mapearCGP(CentroDTO unCentroDTO) {
		val CGP aux = CreaCGP(unCentroDTO)
		(unCentroDTO.serviciosDTO).forEach [ servicio |
			aux.AgregaServicio(mapearServicio(servicio))
		]
		return aux
	}
	
	def CreaCGP(CentroDTO unCentroDTO) {
		var Point puntoCero
		puntoCero = new Point(0, 0)
		new CGP(new Point(unCentroDTO.coordenadaX, unCentroDTO.coordenadaY), 'CGP' + unCentroDTO.domicilio,
		new Comuna('CGP: ' + unCentroDTO.domicilio, puntoCero, puntoCero, puntoCero))
	}

	// Para cada servicio, se mapean su lista de dias y horarios.
	def mapearServicio(ServicioDTO unServicioDTO) {
		var Servicio auxServicio
		auxServicio = new Servicio(unServicioDTO.nombreServicio,
			mapearDatos(unServicioDTO.rangos))
	}

	def List<List<Integer>> mapearDatos(List<RangoServicioDTO> rangos) {
		var List<List<Integer>> diasYHorariosDeUnServicio
		diasYHorariosDeUnServicio = rangos.map[rango|mapearRango(rango)]
	}

	def List<Integer> mapearRango(RangoServicioDTO unRangoDTO) {
		var List<Integer> diaYHorarios
		diaYHorarios = new ArrayList<Integer>()
		diaYHorarios.add(unRangoDTO.numeroDia)
		diaYHorarios.add(unRangoDTO.horarioDesde)
		diaYHorarios.add(unRangoDTO.horarioHasta)
		return diaYHorarios
	}
}