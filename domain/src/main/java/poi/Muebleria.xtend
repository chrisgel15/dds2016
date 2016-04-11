package poi

import org.uqbar.geodds.Point
import org.joda.time.DateTime

class Muebleria extends LocalComercial {

	new(Point p, String nombre, String rubro) {
		super(p, nombre)
		this.rubro = rubro
	}

	override BusquedaPorTexto(String texto) {
		super.BusquedaPorTexto(texto)
	}

	new(Point p, String nom, DateTime dispDesde, DateTime dispHasta) {
		super(p, nom, dispDesde, dispHasta)
	}	

	override ConsultaDisponibilidad(Poi poi, DateTime horario) {
		throw new UnsupportedOperationException("TODO: auto-generated method stub")
	}

	override ConsultaCercania(Poi origen) {
		throw new UnsupportedOperationException("TODO: auto-generated method stub")
	}

}
