package poi

import org.uqbar.geodds.Point

class Banco extends Poi {
	
	new(Point p, String nom) {
		super(p, nom)
	}
	
	override ConsultaCercania(Poi origen) {
		throw new UnsupportedOperationException("TODO: auto-generated method stub")
	}
	
	override ConsultaDisponibilidad() {
		throw new UnsupportedOperationException("TODO: auto-generated method stub")
	}	
	
	override BusquedaPorTexto(String texto) {
		throw new UnsupportedOperationException("TODO: auto-generated method stub")
	}

	

}
