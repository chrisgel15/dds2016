package poi

import org.uqbar.geodds.Point

abstract class LocalComercial extends Poi {

	// TODO: Metodos y configuraciones comunes a los Locales Comerciales
	protected String rubro
	
	new(Point p, String nom) {
		super(p, nom)
	}
	
	def Poi BusquedaPorRubro(Poi poi, String texto)
	{
		if (poi.ComparaStrings(this.rubro , texto))
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
