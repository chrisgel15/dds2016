package poi

import org.uqbar.geodds.Point
import org.uqbar.geodds.Polygon
import org.eclipse.xtend.lib.annotations.Accessors
import com.fasterxml.jackson.annotation.JsonIgnoreProperties

@Accessors
@JsonIgnoreProperties("vertices")
class Comuna {

	String nombre
	Polygon vertices

	new(String nombre, Point punto1, Point punto2, Point punto3) {
		this.nombre = nombre
		this.vertices = new Polygon()
		this.vertices.add(punto1)
		this.vertices.add(punto2)
		this.vertices.add(punto3)
	}

	def AgregarVertice(Point vertice) {
		this.vertices.add(vertice)
	}

	def boolean PertenecePoint(Point punto) {
		this.vertices.isInside(punto)
	}

	def AmbosPuntosPertenecen(Point punto1, Point punto2) {
		this.PertenecePoint(punto1) && this.PertenecePoint(punto2)
	}

}
