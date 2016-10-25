package poi

//import org.apache.commons.collections15.Predicate
//import org.uqbar.commons.model.CollectionBasedRepo
import java.util.List
import org.hibernate.Criteria
import org.hibernate.criterion.Restrictions
import org.hibernate.HibernateException
import org.hibernate.FetchMode

class RepositorioUsuarios extends /*CollectionBasedRepo*/RepoDefault<Usuario> {
	
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
		if (allInstances.isEmpty) {
		val Usuario usu1 = new Usuario("christiangelman@gmail.com", "abc123") 
		this.create(usu1)
		this.create(new Usuario("chrisgel15@hotmail.com", "abc123"))
		this.create(new Usuario("rominacuadra@gmail.com", "abc123"))
		this.create(new Usuario("federicomandri@hotmail.com", "abc123"))
		this.create(new Usuario("juanpabloferreira@gmail.com", "abc123"))
		this.create(new Usuario("kenchi@gmail.com", "abc123"))
		}
	}

//	override protected Predicate<Usuario> getCriterio(Usuario example) {
//		throw new UnsupportedOperationException("TODO: auto-generated method stub")
//	}

	override getEntityType() {
		typeof(Usuario)
	}

	def search(String nombre, String pass) {
		allInstances.findFirst[usu|usu.BusquedaPorNombreYPass(nombre, pass)]
	}
	
//	override createExample() {
//		throw new UnsupportedOperationException("TODO: auto-generated method stub")
//	}
	
	def List<Usuario> BuscarPorTexto(String texto)
	{
		//this.search(texto)
	}
	
	def AgregarPoi(Usuario usu)
	{
		this.create(usu);
	}
	
	override addQueryByExample(Criteria criteria, Usuario usuario) {
		if (usuario.nombre != null) {
			criteria.add(Restrictions.eq("nombre", usuario.nombre))
			criteria.add(Restrictions.eq("password", usuario.password))
		}
	}
	
	def Usuario searchByNamePass(String nom, String pass) {
		val session = openSession
		//var Usuario user
		try {
			 session.createCriteria(Usuario)
			 	
				.add(Restrictions.eq("nombre",nom))
				.add(Restrictions.eq("password",pass))
				.setFetchMode("favoritosId",FetchMode.JOIN)
				.uniqueResult as Usuario
				
		} catch (HibernateException e) {
			throw new RuntimeException(e)
		} finally {
			session.close
		}
	}
	
//	override addQueryByIdUser(Criteria criteria, Integer id, Usuario user) {
//		if (user.nombre != null) {
//			criteria.add(Restrictions.eq("Identificador", user.id))
//		}
//	}
	
//	override addQueryByCriterio(Criteria criteria, List<String> criterios, Poi p) {
//		throw new UnsupportedOperationException("TODO: auto-generated method stub")
//	}
	
//	override addQueryByIdPoi(Criteria criteria, Integer id, Poi p) {
//		throw new UnsupportedOperationException("TODO: auto-generated method stub")
//	}
	
}
