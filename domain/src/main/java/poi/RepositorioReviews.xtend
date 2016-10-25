package poi

import org.hibernate.Criteria
import org.hibernate.criterion.Restrictions
import org.hibernate.HibernateException

class RepositorioReviews extends RepoDefault<Review> {
	
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
				.add(Restrictions.eq("idUser",idUser)) // Chequear el nombre!
				.add(Restrictions.eq("idPoi",idPoi)) // Chequear el nombre!
				.uniqueResult as Review				
		} catch (HibernateException e) {
			throw new RuntimeException(e)
		} finally {
			session.close
		}
	}
	
	def CrearReview(Review review) {
		if (searchByIdPoiAndIdUser(review.usuario.id, review.id) != null)
			this.create(review)
	}
	
}