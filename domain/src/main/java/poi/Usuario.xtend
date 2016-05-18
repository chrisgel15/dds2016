package poi

import org.eclipse.xtend.lib.annotations.Accessors
import java.util.List
import java.util.ArrayList

@Accessors
class Usuario {
	String direccionDeMail
	List<Mail> casilla	
	new(String unaDireccion) {
		this.direccionDeMail = unaDireccion
		casilla = new ArrayList<Mail>()
	}
	def void recibirMail(Mail mail){
		casilla.add(mail)
	}
	
}