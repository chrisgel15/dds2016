package poi

import org.eclipse.xtend.lib.annotations.Accessors

@Accessors
class Mail {
	String from
	String to
	String message
	String asunto

	new(String de, String para, String mensaje, String asuntoMail){
		from = de
		to = para
		message = mensaje
		asunto = asuntoMail		
	}
}