package poi

import org.uqbar.geodds.Point
import org.eclipse.xtend.lib.annotations.Accessors
import java.util.List
import java.util.ArrayList

@Accessors
class TouchMe extends PuntoBase {

	IBuscarPorTexto servicio
	List<IAccionCommand> listCommads

	new(Point point, String nom) {
		//super(point, nom)
		this.localizacionPropia = point
		this.nombre = nom
		listCommads = new ArrayList<IAccionCommand>()
	}

	def AgregarServicioBusquedaPorTexto(IBuscarPorTexto servicio) {
		this.servicio = servicio
	}

}
