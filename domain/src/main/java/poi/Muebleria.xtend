package poi

class Muebleria extends LocalComercial {	

	new (String rubro)
	{
		this.rubro = rubro
	}

	override BusquedaPorTexto(Poi poi, String texto) {
		var Poi auxPoi = null
		auxPoi = this.BusquedaPorEtiqueta(poi, texto)
		if (auxPoi == null)
			auxPoi = this.BusquedaPorNombre(poi, texto)
		if (auxPoi == null)
			auxPoi = this.BusquedaPorRubro(poi, texto)

		return auxPoi
	}
	
	override ConsultaDisponibilidad() {
		throw new UnsupportedOperationException("TODO: auto-generated method stub")
	}

}
