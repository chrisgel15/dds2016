package poi

import org.hibernate.SessionFactory
import org.hibernate.cfg.Configuration
import org.hibernate.Criteria
import java.util.List
import org.hibernate.HibernateException
import org.hibernate.criterion.Restrictions

abstract class RepoDefault<T> {
	
	private static final SessionFactory sessionFactory = new Configuration().configure()
		
		.addAnnotatedClass(Poi)
		.addAnnotatedClass(ParadaColectivo)
		.addAnnotatedClass(Review)
		.addAnnotatedClass(Banco)
		.addAnnotatedClass(Usuario)
		.addAnnotatedClass(Servicio)
		.addAnnotatedClass(HorarioDeAtencion)
		.addAnnotatedClass(CGP)
		.buildSessionFactory()
		
		def abstract Class<T> getEntityType()
	
		def abstract void addQueryByExample(Criteria criteria, T t)
		def abstract void addQueryByCriterio(Criteria criteria, List<String> criterios, Poi p)
		//def abstract void addQueryByIdPoi(Criteria criteria, Integer id, Poi p)
		//def abstract void addQueryByIdUser(Criteria criteria, Integer id, Usuario user)
		
		def openSession() {
			sessionFactory.openSession
		}
		
		def List<T> allInstances() {
		val session = sessionFactory.openSession
		try {
			return session.createCriteria(getEntityType).list()
		} finally {
			session.close
		}
	}
	
	def List<T> searchByExample(T t) {
		val session = sessionFactory.openSession
		try {
			val criteria = session.createCriteria(getEntityType)
			this.addQueryByExample(criteria, t)
			return criteria.list()
		} catch (HibernateException e) {
			throw new RuntimeException(e)
		} finally {
			session.close
		}
	}
	
	def List<T> searchByCriterio(List<String> criterios) {
		var Poi p
		val session = sessionFactory.openSession
		try {
			val criteria = session.createCriteria(getEntityType)
			this.addQueryByCriterio(criteria, criterios,p)
			return criteria.list()
		} catch (HibernateException e) {
			throw new RuntimeException(e)
		} finally {
			session.close
		}
	}
	
//	def T searchByIdPoi(Integer id) {
//		var Poi p
//		val session = sessionFactory.openSession
//		try {
//			val criteria = session.createCriteria(getEntityType)
//			this.addQueryByIdPoi(criteria, id ,p)
//			return criteria as T
//		} catch (HibernateException e) {
//			throw new RuntimeException(e)
//		} finally {
//			session.close
//		}
//	}
	
//	def T searchByIdUser(Integer id) {
//		var Usuario u
//		val session = sessionFactory.openSession
//		try {
//			val criteria = session.createCriteria(getEntityType)
//			this.addQueryByIdUser(criteria, id ,u)
//			return criteria as T
//		} catch (HibernateException e) {
//			throw new RuntimeException(e)
//		} finally {
//			session.close
//		}
//	}
	
	
	def T searchById(Integer id) {
		val session = openSession
		try {
			session.createCriteria(getEntityType)
				//.setFetchMode("candidatos", FetchMode.JOIN)
				.add(Restrictions.eq("id", id))
				.uniqueResult as T
		} catch (HibernateException e) {
			throw new RuntimeException(e)
		} finally {
			session.close
		}
	}
	

	
	
	def void create(T t) {
		val session = sessionFactory.openSession
		try {
			session.beginTransaction
			session.save(t)
			session.getTransaction.commit
		} catch (HibernateException e) {
			session.getTransaction.rollback
			throw new RuntimeException(e)
		} finally {
			session.close
		}
	}
	
	def void update(T t) {
		val session = sessionFactory.openSession
		try {
			session.beginTransaction
			session.update(t) //saveOrUpdate()
			session.getTransaction.commit
		} catch (HibernateException e) {
			session.getTransaction.rollback
			throw new RuntimeException(e)
		} finally {
			session.close
		}
	}
	
}