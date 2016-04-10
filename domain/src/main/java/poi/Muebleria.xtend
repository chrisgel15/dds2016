package poi

import org.uqbar.geodds.Point

class Muebleria extends LocalComercial {	

	new (Point p, String nombre, String rubro)
	{
		super(p, nombre)
		this.rubro = rubro
	}

	override BusquedaPorTexto(String texto) {
		super.BusquedaPorTexto(texto)
	}
	
	override ConsultaDisponibilidad() {
		throw new UnsupportedOperationException("TODO: auto-generated method stub")
	}
	
	override ConsultaCercania(Poi origen) {
		throw new UnsupportedOperationException("TODO: auto-generated method stub")
	}

}
