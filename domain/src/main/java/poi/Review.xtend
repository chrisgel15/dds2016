package poi

import javax.persistence.Column
import javax.persistence.Entity
import javax.persistence.FetchType
import javax.persistence.GeneratedValue
import javax.persistence.Id
import javax.persistence.ManyToOne
import org.eclipse.xtend.lib.annotations.Accessors

@Accessors
@Entity
class Review {
	@Id
	@GeneratedValue
	private Long id
	
	@Column
	String comentario
	
	@Column
	Integer puntaje
	
	@ManyToOne(fetch=FetchType.EAGER)
	Usuario usuario

	new(Usuario usuario, Integer puntaje, String comentario) {
		this.usuario = usuario
		this.puntaje = puntaje
		this.comentario = comentario
	}
	
	new()
	{
		
	}

	override equals(Object arg0) {
		try {
			if (arg0 == null) {
				return false;
			}
			var comment = arg0 as Review
			if (this.usuario == null || comment.usuario == null) {
				return super.equals(arg0);
			}
			return this.usuario.equals(comment.usuario)
		} catch (ClassCastException e) {
			return false;
		}
	}

}
