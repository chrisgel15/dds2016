
package poi

import org.uqbar.geodds.Point

class TouchMe extends PuntoBase {
	
	IBuscarPorTexto servicio

	new(Point point, String nom) {
		super(point, nom)
	}
	
	def AgregarServicioBusquedaPorTexto(IBuscarPorTexto servicio)
	{
		this.servicio = servicio
	}

}

