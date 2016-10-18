package poi

import org.eclipse.xtend.lib.annotations.Accessors
import javax.persistence.Entity
import javax.persistence.Column
import javax.persistence.Id
import javax.persistence.GeneratedValue
import javax.persistence.MappedSuperclass
import javax.persistence.ManyToOne
import javax.persistence.Embeddable
import javax.persistence.Table

//@Entity
//@Table
@Accessors
class Mail {
	//@Id
	//@GeneratedValue
	private Long id
	
	//@Column(length=50) 
	String from
	
	//@Column(length=50) 	
	String to
	
	//@Column 
	String message
	
	//@Column(length=50) 
	String asunto

	new(String de, String para, String mensaje, String asuntoMail){
		from = de
		to = para
		message = mensaje
		asunto = asuntoMail		
	}
	
	new(){
		
	}
}