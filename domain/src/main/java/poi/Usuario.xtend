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
	//List<Poi> favoritos
	List<Integer> favoritosId	
	
	new(String unaDireccion) {
		this.direccionDeMail = unaDireccion
		casilla = new ArrayList<Mail>()
	}
	public new(String nombre, String pass)
	{
		this.nombre = nombre
		this.password = pass
	//	this.favoritos = new ArrayList<Poi>()
		this.favoritosId = new ArrayList<Integer>()
	}
	
	def void AgregarFavorito(Poi p)
	{
		if (!this.favoritosId.contains(p.id))
			this.favoritosId.add(p.id)
		else
			this.favoritosId.remove(p.id)
	}
	
//	def void generarFavoritosId()
//	{
//		var ArrayList<Integer> auxFavoritosId = new ArrayList<Integer>()
//		this.favoritos.forEach[ f | AgregarFavoritoId(f.id) ]
//	}
//	
//	def void AgregarFavoritoId(Integer id)
//	{
//		this.favoritosId.add(id)
//	}
	
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