
package poi

import org.uqbar.geodds.Point
//import org.uqbar.commons.model.Entity
import org.eclipse.xtend.lib.annotations.Accessors
import javax.persistence.Entity
import javax.persistence.Inheritance
import javax.persistence.InheritanceType
import javax.persistence.Column
import javax.persistence.Id
import javax.persistence.GeneratedValue

@Entity
@Inheritance(strategy=InheritanceType.JOINED)
@Accessors
abstract class PuntoBase /*extends Entity*/ {
	
	@Id
	@GeneratedValue
	private Long id
	
	public Point localizacionPropia
	
	@Column(length=100)
	public String nombre
	
	new(Point point, String nom) {
		this.localizacionPropia = point
		this.nombre = nom
	}	

}