
package poi

import javax.persistence.Column
import javax.persistence.GeneratedValue
import javax.persistence.Id
import javax.persistence.Transient
import org.eclipse.xtend.lib.annotations.Accessors
import org.uqbar.geodds.Point
import javax.persistence.Entity

@Entity
@Accessors
abstract class PuntoBase extends org.uqbar.commons.model.Entity{
	
	@Transient
	public Point localizacionPropia
	
	@Id
	@GeneratedValue
	private Long id_persistencia
	
	@Column(length=100)
	public String nombre
	
//	new(Point point, String nom) {
//		this.localizacionPropia = point
//		this.nombre = nom
//	}	
//	
	new(){
		
	}

}