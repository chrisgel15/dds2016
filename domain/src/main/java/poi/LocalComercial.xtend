package poi

import org.joda.time.DateTime
import org.joda.time.Interval
import org.uqbar.geodds.Point

abstract class LocalComercial extends Poi {

	// TODO: Metodos y configuraciones comunes a los Locales Comerciales
	DateTime inicio
	DateTime fin
	Interval intervalo

	new(Point p, String nom, DateTime dispDesde, DateTime dispHasta) {
		super(p, nom)
		this.inicio = dispDesde
		this.fin = dispHasta
		intervalo = new Interval(inicio, fin);
	}

	override boolean ConsultaDisponibilidad(Poi poi, DateTime horario) {
		intervalo.contains(horario)
	}

	protected String rubro

	new(Point p, String nom) {
		super(p, nom)
	}

	def Poi BusquedaPorRubro(Poi poi, String texto) {
		if (poi.ComparaStrings(this.rubro, texto))
			return poi
		else
			return null
	}

	override BusquedaPorTexto(String texto) {
		var Poi auxPoi = null
		auxPoi = this.BusquedaPorEtiqueta(this, texto)
		if (auxPoi == null)
			auxPoi = this.BusquedaPorNombre(this, texto)
		if (auxPoi == null)
			auxPoi = this.BusquedaPorRubro(this, texto)

		return auxPoi
	}

}
