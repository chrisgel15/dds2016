package poi

import org.hibernate.Criteria
import org.hibernate.criterion.Restrictions
import org.hibernate.HibernateException
import java.util.ArrayList

class RepositorioReviews extends RepoDefault<Review> {
	
	/* Singleton */
	static RepositorioReviews repoReview
	
	def static RepositorioReviews getInstance() {
		if (repoReview == null) {
			repoReview = new RepositorioReviews
		}
		repoReview
	}
	
	override getEntityType() {
		typeof(Review)
	}
	
	override addQueryByExample(Criteria criteria, Review t) {
		throw new UnsupportedOperationException("TODO: auto-generated method stub")
	}
	
	def Review searchByIdPoiAndIdUser(Long idUser, Long idPoi) {
		val session = openSession
		//var Usuario user
		try {
			 session.createCriteria(Review)			 	
				.add(Restrictions.eq("usuario.id",idUser)) // Chequear el nombre!
				.add(Restrictions.eq("poi.id",idPoi))
				.uniqueResult as Review				
		} catch (HibernateException e) {
			throw new RuntimeException(e)
		} finally {
			session.close
		}
	}
	
	def searchByPoiId(long l) {
		val session = openSession
		//var Usuario user
		try {
			 session.createCriteria(Review)	 	
				.add(Restrictions.eq("poi.id",l))	
				.list	
		} catch (HibernateException e) {
			throw new RuntimeException(e)
		} finally {
			session.close
		}
	}
	
}

class YaExisteReviewException extends RuntimeException
{
	new(String msg)
	{
		super(msg)
	}
}