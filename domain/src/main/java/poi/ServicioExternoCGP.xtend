package poi

import java.util.List
import org.eclipse.xtend.lib.annotations.Accessors
import java.util.ArrayList
import org.uqbar.geodds.Point

@Accessors
class ServicioExternoCGP {
	
	List<CentroDTO> listaDTO = new ArrayList<CentroDTO>()
	List<ServicioDTO> listaServicioDTO = new ArrayList<ServicioDTO>()
	List<RangoServicioDTO> listaRangoDTO = new ArrayList<RangoServicioDTO>()
	List<Poi> pois = new ArrayList<Poi>()
	List<Servicio> servicios = new ArrayList<Servicio>()
	List<HorarioDeAtencion> horarios = new ArrayList<HorarioDeAtencion>()
	List<Integer> rangosDeHoras = new ArrayList<Integer>()
	CGP aux
	Servicio auxServicio
	List<Integer> a
	List<List<Integer>> b
	
	
	
	def List<Poi> BuscarPorTexto(String texto)
	{	
		this.Map(listaDTO)
		// Debe retornar una lista de Pois...
	}
	
	def List<Poi> Map(List<CentroDTO> dtoCGPs){
		// Aca se mapea el CentroDTO que viene del servicio externo a nuestro dominio...
		
		listaDTO.forEach[centro|listarCGP(centro)]
		return pois
		
 		
 
	}
	
	def List<Poi> listarCGP(CentroDTO unCentroDTO){
		pois.add(mapearCGP(unCentroDTO))
					
		//listaServicioDTO.forEach[servicio|listarServicio(servicio)]
		
		return pois
	}
	
//	def List<Servicio> listarServicio(ServicioDTO unServicioDTO){
//		servicios.add(mapearServicio(unServicioDTO))
//		
//		listaRangoDTO.forEach[rango|listarRango(rango)]
//		
//		return servicios
//		
//	}
	
//	def List<HorarioDeAtencion> listarRango(RangoServicioDTO unRangoDTO){
//		horarios.add(mapearRango(unRangoDTO))
//		return horarios
//	}
	
	def mapearCGP(CentroDTO unCentroDTO){
		 
		aux= new CGP(new Point(unCentroDTO.coordenadaX,unCentroDTO.coordenadaY),
			'CGP'+ unCentroDTO.domicilio,
			new Comuna('CGP'+ unCentroDTO.domicilio,new Point(0,0),new Point(0,0),new Point(0,0)))
		//Para cada centroDTO crea un CGP y le asigna la lista de servicios//
		(unCentroDTO.serviciosDTO).forEach[servicio|aux.AgregaServicio(mapearServicio(servicio))]
		return aux
	}
	
	def mapearServicio(ServicioDTO unServicioDTO){
		auxServicio = new Servicio(unServicioDTO.nombreServicio, 
			mapearDatos(unServicioDTO.rangos)
		)			
	}
	
	def List<List<Integer>> mapearDatos(List<RangoServicioDTO> rangos){
		b = rangos.map[ rango | mapearRango(rango)]
	}
	
	def List<Integer> mapearRango(RangoServicioDTO unRangoDTO){
		a = new ArrayList<Integer>()
		a.add(unRangoDTO.numeroDia)
		a.add(unRangoDTO.horarioDesde)
		a.add(unRangoDTO.horarioHasta)
		return a
	}
}