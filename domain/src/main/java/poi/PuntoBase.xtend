<<<<<<< HEAD:domain/src/main/java/poi/PuntoBase.xtend
package poi

import org.uqbar.geodds.Point

abstract class PuntoBase {
	public Point localizacionPropia
	public String nombre
	
	new(Point point, String nom) {
		this.localizacionPropia = point
		this.nombre = nom
	}
	
	def getLocacionPropia() {
		localizacionPropia
	}
	
=======
package poi

import org.uqbar.geodds.Point

abstract class PuntoBase {
	public Point localizacionPropia
	public String nombre
	
	new(Point point, String nom) {
		this.localizacionPropia = point
		this.nombre = nom
	}
	
	def getLocacionPropia() {
		localizacionPropia
	}
	
>>>>>>> 7c550f447ab8b9d14b1b92739ffbe94fafbed151:domain/src/main/java/poi/PuntoBase.xtend
}