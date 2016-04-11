package poi

import org.uqbar.geodds.Point

class LibreriaEscolar extends LocalComercial {

	static double DISTANCIA_LIBRERIA_ESCOLAR = 0.5

	new(Point p, String nom, HorarioDeAtencion horario, String rubro) {
		super(p, nom, horario, rubro)
	}

	override ConsultaCercania(Poi origen) {
		this.DistanciaAOtroPoiMenorA(origen, DISTANCIA_LIBRERIA_ESCOLAR)
	}

}
