package poi

import org.uqbar.geodds.Point

class KioscoDiarios extends LocalComercial {

	static double DISTANCIA_KIOSCO_DIARIOS = 0.2

	new(Point p, String nom, HorarioDeAtencion horario, String rubro) {
		super(p, nom, horario, rubro)
	}

	override boolean ConsultaCercania(Poi destino) {
		this.DistanciaAOtroPoiMenorA(destino, DISTANCIA_KIOSCO_DIARIOS)
	}

}
