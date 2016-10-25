package poi

import org.eclipse.xtend.lib.annotations.Accessors
import java.util.List
import java.util.ArrayList
//import org.uqbar.commons.model.Entity
import com.fasterxml.jackson.annotation.JsonIgnoreProperties
import javax.persistence.Entity
import javax.persistence.Id
import javax.persistence.GeneratedValue
import javax.persistence.Column
import javax.persistence.OneToMany
import javax.persistence.FetchType
import javax.persistence.ElementCollection
import javax.persistence.CascadeType
import javax.persistence.JoinColumn
import javax.naming.Name
import javax.persistence.ManyToMany

@JsonIgnoreProperties(ignoreUnknown = true)
@Accessors
@Entity

class Usuario{
	
	@Id
	@GeneratedValue
	private Long id
	
//	@Column(length=50)
//	String direccionDeMail
	
	@Column(length=50)
	String nombre
	
	@Column(length=50)
	String password
	
//	@OneToMany(cascade=CascadeType.ALL, fetch = FetchType.EAGER)
//	List<Mail> casilla
	
	//List<Poi> favoritos
	@ElementCollection
	List<Long> favoritosId	
	
//	new(String unaDireccion) {
//		this.direccionDeMail = unaDireccion
//		casilla = new ArrayList<Mail>()
//	}
	public new(String nombre, String pass)
	{
		this.nombre = nombre
		this.password = pass
	//	this.favoritos = new ArrayList<Poi>()
		this.favoritosId = new ArrayList<Long>()
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
//	def void recibirMail(Mail mail){
//		casilla.add(mail)
//	}
	
	def BusquedaPorNombreYPass(String nombre, String pass)
	{
		return nombre.equalsIgnoreCase(this.nombre) && pass.equalsIgnoreCase(this.password)
	}
	
}