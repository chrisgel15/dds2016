package poi

import org.joda.time.DateTime

abstract class GenericPoi implements IUbicable {
	
	static double DISTANCIA_GENERAL = 0.5
	// TODO: Comportamiento general de los tipos concretos
	override boolean ConsultaCercania(Poi origen, Poi destino)
	{
		origen.DistanciaAOtroPoiMenorA(destino, DISTANCIA_GENERAL)
	}
	
	def Poi BusquedaPorNombre(Poi poi , String nombre)
	{
		poi.BusquedaNombre(nombre)
	}
	
	def Poi BusquedaPorEtiqueta(Poi poi, String etiqueta)
	{
		poi.BusquedaEtiqueta(etiqueta)
	}
	override boolean ConsultaDisponibilidad(Poi poi, DateTime horario){
		poi.servicioEstaDisponible(horario)
	}
	
	def boolean esFinDeSemana(DateTime fecha){
		var int diaDeLaSemana
		diaDeLaSemana = fecha.getDayOfWeek()
		return (diaDeLaSemana != 6 && diaDeLaSemana !=7)
	}
}