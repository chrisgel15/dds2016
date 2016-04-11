package poi

import org.uqbar.geodds.Point
import org.joda.time.DateTime

class LibreriaEscolar extends LocalComercial {

	static double DISTANCIA_LIBRERIA_ESCOLAR = 0.5

	new(Point p, String nombre, String rubro) {
		super(p, nombre)
		this.rubro = rubro
	}

	new(Point p, String nom, DateTime dispDesde, DateTime dispHasta, String rubro) {
		super(p, nom, dispDesde, dispHasta)
		this.rubro = rubro
	}

	override boolean ConsultaDisponibilidad(Poi poi, DateTime horario) {
		throw new UnsupportedOperationException("TODO: auto-generated method stub")
	}

	override BusquedaPorTexto(String texto) {
		super.BusquedaPorTexto(texto)
	}

	override ConsultaCercania(Poi origen) {
		this.DistanciaAOtroPoiMenorA(origen, DISTANCIA_LIBRERIA_ESCOLAR)
	}

}
