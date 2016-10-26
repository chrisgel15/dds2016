package poi

import java.util.List
import org.hibernate.Criteria
import org.hibernate.HibernateException
import org.hibernate.SessionFactory
import org.hibernate.cfg.Configuration
import org.hibernate.criterion.Restrictions

abstract class RepoDefault<T> {

	private static final SessionFactory sessionFactory = new Configuration().configure().addAnnotatedClass(Poi).
		addAnnotatedClass(ParadaColectivo).addAnnotatedClass(Review).addAnnotatedClass(Banco).
		addAnnotatedClass(Usuario).addAnnotatedClass(Servicio).addAnnotatedClass(HorarioDeAtencion)// .addAnnotatedClass(CGP)
		.buildSessionFactory()

	def abstract Class<T> getEntityType()

	def abstract void addQueryByExample(Criteria criteria, T t)

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

	def T searchById(Long id) {
		val session = openSession
		try {
			session.createCriteria(getEntityType)// .setFetchMode("reviews", FetchMode.JOIN)
			.add(Restrictions.eq("id", id)).uniqueResult as T
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
			session.saveOrUpdate(t)
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
			session.update(t) // saveOrUpdate()
			session.getTransaction.commit
		} catch (HibernateException e) {
			session.getTransaction.rollback
			throw new RuntimeException(e)
		} finally {
			session.close
		}
	}

}
