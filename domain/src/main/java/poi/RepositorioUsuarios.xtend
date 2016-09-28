package poi

import org.apache.commons.collections15.Predicate
import org.uqbar.commons.model.CollectionBasedRepo
import java.util.List

class RepositorioUsuarios extends CollectionBasedRepo<Usuario> {
	
	/* Singleton */
	static RepositorioUsuarios repoUsuarios

	def static RepositorioUsuarios getInstance() {
		if (repoUsuarios == null) {
			repoUsuarios = new RepositorioUsuarios
		}
		repoUsuarios
	}
	
	new()
	{
		val Usuario usu1 = new Usuario("christiangelman@gmail.com", "abc123")
		usu1.AgregarFavorito(RepositorioPoi.instance.allInstances.get(0))
		usu1.AgregarFavorito(RepositorioPoi.instance.allInstances.get(1)) 
		this.create(usu1)
		this.create(new Usuario("chrisgel15@hotmail.com", "abc123"))
		this.create(new Usuario("rominacuadra@gmail.com", "abc123"))
		this.create(new Usuario("federicomandri@hotmail.com", "abc123"))
		this.create(new Usuario("juanpabloferreira@gmail.com", "abc123"))
		this.create(new Usuario("kenchi@gmail.com", "abc123"))
	}

	override protected Predicate<Usuario> getCriterio(Usuario example) {
		throw new UnsupportedOperationException("TODO: auto-generated method stub")
	}

	override getEntityType() {
		typeof(Usuario)
	}

	def search(String nombre, String pass) {
		allInstances.findFirst[usu|usu.BusquedaPorNombreYPass(nombre, pass)]
	}
	
	override createExample() {
		throw new UnsupportedOperationException("TODO: auto-generated method stub")
	}
	
	def List<Usuario> BuscarPorTexto(String texto)
	{
		//this.search(texto)
	}
	
	def AgregarPoi(Usuario usu)
	{
		this.create(usu);
	}
	
}
