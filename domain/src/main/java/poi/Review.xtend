package poi

import org.eclipse.xtend.lib.annotations.Accessors

@Accessors
class Review {
	String comentario
	Integer puntaje
	Usuario usuario

	new(Usuario usuario, Integer puntaje, String comentario) {
		this.usuario = usuario
		this.puntaje = puntaje
		this.comentario = comentario
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
