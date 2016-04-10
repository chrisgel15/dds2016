package poi

import org.uqbar.geodds.Point

class LibreriaEscolar extends LocalComercial {

	static double DISTANCIA_LIBRERIA_ESCOLAR = 0.5
	
	new (Point p, String nombre, String rubro)
	{
		super(p, nombre)
		this.rubro = rubro
	}

	override ConsultaDisponibilidad() {
		throw new UnsupportedOperationException("TODO: auto-generated method stub")
	}

	override BusquedaPorTexto(String texto) {
		super.BusquedaPorTexto(texto)
	}
	
	override ConsultaCercania(Poi origen) {
		this.DistanciaAOtroPoiMenorA(origen, DISTANCIA_LIBRERIA_ESCOLAR)
	}

}
