package poi

import org.joda.time.DateTime
import org.joda.time.Interval

abstract class LocalComercial extends GenericPoi {

	// TODO: Metodos y configuraciones comunes a los Locales Comerciales

	DateTime inicio
	DateTime fin
	Interval intervalo
	
	new(DateTime dispDesde, DateTime dispHasta) {
		this.inicio = dispDesde
		this.fin = dispHasta
		intervalo = new Interval(inicio, fin);
	}
	
	override boolean ConsultaDisponibilidad(Poi poi, DateTime horario) {
			intervalo.contains(horario)
	}
	
	protected String rubro
	
	def Poi BusquedaPorRubro(Poi poi, String texto)
	{
		if (poi.ComparaStrings(this.rubro , texto))
			return poi
		else
			return null
	}

}
