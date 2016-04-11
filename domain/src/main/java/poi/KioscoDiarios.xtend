package poi
import org.uqbar.geodds.Point
import org.joda.time.DateTime


class KioscoDiarios extends LocalComercial {

	static double DISTANCIA_KIOSCO_DIARIOS = 0.2
	
	new(Point p, String nom, DateTime dispDesde, DateTime dispHasta) {
		super(p, nom, dispDesde, dispHasta)
	}


	new(Point p, String nom) {
		super(p, nom)
	}

	override boolean ConsultaDisponibilidad(Poi poi, DateTime horario) {

		throw new UnsupportedOperationException("TODO: auto-generated method stub")
	}

	override boolean ConsultaCercania(Poi destino) {
		this.DistanciaAOtroPoiMenorA(destino, DISTANCIA_KIOSCO_DIARIOS)
	}

	override BusquedaPorTexto(String texto) {
		super.BusquedaPorTexto(texto)
	}

}
