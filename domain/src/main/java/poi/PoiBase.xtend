package poi

import org.uqbar.geodds.Point

class PoiBase {
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