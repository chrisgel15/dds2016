package poi

import org.eclipse.xtend.lib.annotations.Accessors
import java.util.List
import java.util.ArrayList
import org.uqbar.commons.model.Entity
import com.fasterxml.jackson.annotation.JsonIgnoreProperties

@JsonIgnoreProperties(ignoreUnknown = true)
@Accessors
class Usuario extends Entity {
	String direccionDeMail
	String nombre
	String password
	List<Mail> casilla	
	
	new(String unaDireccion) {
		this.direccionDeMail = unaDireccion
		casilla = new ArrayList<Mail>()
	}
	public new(String nombre, String pass)
	{
		this.nombre = nombre
		this.password = pass
	}
	
	public new() {
		
	}
	def void recibirMail(Mail mail){
		casilla.add(mail)
	}
	
	def BusquedaPorNombreYPass(String nombre, String pass)
	{
		return nombre.equalsIgnoreCase(this.nombre) && pass.equalsIgnoreCase(this.password)
	}
	
}