
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
import javax.persistence.Transient

@Entity
//@Inheritance(strategy=InheritanceType.SINGLE_TABLE)
@Accessors
abstract class PuntoBase{
	
	@Transient
	public Point localizacionPropia
	
	@Id
	@GeneratedValue
	private Long id
	
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