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
		this.create(new Usuario("christiangelman@gmail.com"))
		this.create(new Usuario("chrisgel15@hotmail.com"))
		this.create(new Usuario("rominacuadra@gmail.com"))
		this.create(new Usuario("federicomandri@hotmail.com"))
		this.create(new Usuario("juanpabloferreira@gmail.com"))
		this.create(new Usuario("kenchi@gmail.com"))
	}

	override protected Predicate<Usuario> getCriterio(Usuario example) {
		throw new UnsupportedOperationException("TODO: auto-generated method stub")
	}

	override getEntityType() {
		typeof(Usuario)
	}

	def search(String texto) {
		//allInstances.filter[usu|usu.BusquedaPorTexto(texto)].toList
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
