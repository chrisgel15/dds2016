package poi

import org.eclipse.xtend.lib.annotations.Accessors
import java.util.List
import java.util.ArrayList
import org.uqbar.commons.model.Entity

@Accessors
class Usuario extends Entity {
	String direccionDeMail
	List<Mail> casilla	
	new(String unaDireccion) {
		this.direccionDeMail = unaDireccion
		casilla = new ArrayList<Mail>()
	}
	def void recibirMail(Mail mail){
		casilla.add(mail)
	}
	
	def BusquedaPorTexto(String string) {
		throw new UnsupportedOperationException("TODO: auto-generated method stub")
	}
	
}