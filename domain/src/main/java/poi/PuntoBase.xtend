
package poi

import org.uqbar.geodds.Point
import org.uqbar.commons.model.Entity

abstract class PuntoBase extends Entity {
	public Point localizacionPropia
	public String nombre
	
	new(Point point, String nom) {
		this.localizacionPropia = point
		this.nombre = nom
	}
	
	def getLocacionPropia() {
		localizacionPropia
	}
	

}