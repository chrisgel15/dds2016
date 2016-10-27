package poi

import org.uqbar.geodds.Point
import org.uqbar.geodds.Polygon
import org.eclipse.xtend.lib.annotations.Accessors
import com.fasterxml.jackson.annotation.JsonIgnoreProperties
import javax.persistence.Entity
import javax.persistence.Column
import javax.persistence.Transient
import javax.persistence.Id
import javax.persistence.GeneratedValue

@Accessors
@JsonIgnoreProperties("vertices")
@Entity
class Comuna {

	@Id
	@GeneratedValue
	private Long id

	@Column(length = 100)
	String nombre
	@Transient
	Polygon vertices

	new(String nombre, Point punto1, Point punto2, Point punto3) {
		this.nombre = nombre
		this.vertices = new Polygon()
		this.vertices.add(punto1)
		this.vertices.add(punto2)
		this.vertices.add(punto3)
	}
	
	new()
	{
		
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
