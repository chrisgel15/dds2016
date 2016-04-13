package poi

import org.uqbar.geodds.Point

class LibreriaEscolar extends LocalComercial {

	static double DISTANCIA_LIBRERIA_ESCOLAR = 0.5

	new(Point p, String nom, HorarioDeAtencion horario, String rubro) {
		super(p, nom, horario, rubro)
	}

	override ConsultaCercania(PoiBase touchMe) {
		this.DistanciaEsMenorA(touchMe, DISTANCIA_LIBRERIA_ESCOLAR)
	}

}
