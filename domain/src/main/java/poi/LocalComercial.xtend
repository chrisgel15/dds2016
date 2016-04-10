package poi

abstract class LocalComercial extends GenericPoi {

	// TODO: Metodos y configuraciones comunes a los Locales Comerciales
	protected String rubro
	
	def Poi BusquedaPorRubro(Poi poi, String texto)
	{
		if (poi.ComparaStrings(this.rubro , texto))
			return poi
		else
			return null
	}

}
