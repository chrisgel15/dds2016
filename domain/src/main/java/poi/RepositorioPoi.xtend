package poi

//import java.util.ArrayList
//import java.util.HashSet
import java.util.List
//import java.util.Set
//import org.apache.commons.collections15.Predicate
//import org.uqbar.commons.model.CollectionBasedRepo
//import poi.Factories.ComunaFactory
//import poi.Factories.PointFactory
//import poi.Factories.ServiciosFactory
import org.hibernate.Criteria
import org.hibernate.criterion.Restrictions
import org.hibernate.HibernateException
import org.hibernate.FetchMode

class RepositorioPoi extends /*CollectionBasedRepo*/RepoDefault<Poi> {
	
	
	PointFactory pointFactory
	ComunaFactory comunaFactory
	ServiciosFactory servicioFactory
	/* Singleton */
	static RepositorioPoi repoPoi

	def static RepositorioPoi getInstance() {
		if (repoPoi == null) {
			repoPoi = new RepositorioPoi
		}
		repoPoi
	}
	
	new()
	{
		pointFactory = new PointFactory()
		comunaFactory = new ComunaFactory()
		servicioFactory = new ServiciosFactory()		
		this.CrearRepositorio()	
		
	}

//	override protected Predicate<Poi> getCriterio(Poi example) {
//		throw new UnsupportedOperationException("TODO: auto-generated method stub")
//	}

	override getEntityType() {
		typeof(Poi)
	}

	def search(String texto) {
		allInstances.filter[poi|poi.BusquedaPorTexto(texto)].toList
	}
	
//	override createExample() {
//		throw new UnsupportedOperationException("TODO: auto-generated method stub")
//	}
	
	def List<Poi> BuscarPorTexto(String texto)
	{
		this.search(texto)
	}
	
//	def List<Poi> BuscarPorCriterios(List<String> criterios)
//	{
//		val List<Poi> pois = new ArrayList<Poi>()
//		criterios.forEach[ criterio | pois.addAll(BuscarPorTexto(criterio)) ]
//		val Set<Poi> sinRepetidos = new HashSet<Poi>();
//		sinRepetidos.addAll(pois);
//		pois.clear();
//		pois.addAll(sinRepetidos);
//		pois
//	}

	
	
	def AgregarPoi(Poi poi)
	{
		this.create(poi);
	}
	
	
	def CrearRepositorio() {
		var banco1 = new Banco(pointFactory.puntoBancoSantander, "Banco Santander Rio")
		banco1.AgregaServicio(servicioFactory.servicioBanco1)
		banco1.direccion = "Rivadavia 1234"
		banco1.imagenUrl = "imagenes/banco_santander.jpg"
		banco1.zona = "Zona centro"
		//this.create(banco1)
		
		var banco2 = new Banco(pointFactory.puntoBancoSantander, "Banco Frances")
		//banco2.AgregaServicio(servicioFactory.servicioBanco1)
		banco2.AgregaServicio(servicioFactory.servicioBanco2)
		banco2.direccion = "Lavalle 4321"
		banco2.imagenUrl = "imagenes/banco_frances.jpg"
		banco2.zona = "Zona norte"
		//this.create(banco2)
		
		var banco3 = new Banco(pointFactory.puntoBancoSantander, "Banco Galicia")
		//banco3.AgregaServicio(servicioFactory.servicioBanco1)
		//banco3.AgregaServicio(servicioFactory.servicioBanco2)
		banco3.AgregaServicio(servicioFactory.servicioBanco3)
		banco3.direccion = "Cordoba 2222"
		banco3.imagenUrl = "imagenes/banco_galicia.jpg"
		banco3.zona = "Zona oeste"
		//this.create(banco3)
		
		var banco4 = new Banco(pointFactory.puntoBancoSantander, "Banco ICBC")
		banco4.AgregaServicio(servicioFactory.servicioBanco4)
		banco4.direccion = "Rivadavia 3333"
		banco4.imagenUrl = "imagenes/banco_icbc.jpg"
		banco4.zona = "Zona Capital"
		//this.create(banco4)
		
		var banco5 = new Banco(pointFactory.puntoBancoSantander, "Banco Nacion")
		banco5.direccion = "Avenida de Mayo 5454"
		banco5.imagenUrl = "imagenes/banco_nacion.jpg"
		banco5.zona = "Zona GBA"
		//this.create(banco5)
		
		var cgp1 = new CGP(pointFactory.puntoCgp, "CGP Barrio caballito", comunaFactory.comuna13)
		cgp1.direccion = "Chacabuco 678"
		cgp1.imagenUrl = "imagenes/cgp_1.jpg"
		cgp1.AgregaServicio(servicioFactory.servicioCGP1)
		//this.create(cgp1)
		
		var cgp2 = new CGP(pointFactory.puntoCgp, "CGP balvanera", comunaFactory.comunaAlmagro)
		cgp2.direccion = "Castelli 0000"
		cgp2.imagenUrl = "imagenes/cgp_1.jpg"
		cgp2.AgregaServicio(servicioFactory.servicioCGP2)
		cgp2.AgregaServicio(servicioFactory.servicioCGP4)
		cgp2.AgregaServicio(servicioFactory.servicioCGP5)
		//this.create(cgp2)
		
		var cgp3 = new CGP(pointFactory.puntoCgp, "CGP flores 32", comunaFactory.comuna13)
		cgp3.direccion = "Pueyrredon 3467"
		cgp3.imagenUrl = "imagenes/cgp_1.jpg"
		cgp3.AgregaServicio(servicioFactory.servicioCGP3)
		cgp3.AgregaServicio(servicioFactory.servicioCGP4)
		//this.create(cgp3)
		
		var colectivo1 = new ParadaColectivo(pointFactory.puntoCero, "Colectivo linea 132")
		colectivo1.direccion = "Acoyte y Rivadavia"
		colectivo1.imagenUrl = "imagenes/linea132.jpg"
		//this.create(colectivo1)
		
		var colectivo2 = new ParadaColectivo(pointFactory.puntoCero, "Colectivo linea 98")
		colectivo2.direccion = "Estacion Once"
		colectivo2.imagenUrl = "imagenes/linea132.jpg"
		//this.create(colectivo2)
		
		var colectivo3 = new ParadaColectivo(pointFactory.puntoCero, "Colectivo linea 441")
		colectivo3.direccion = "Videla y Trole"
		colectivo3.imagenUrl = "imagenes/linea132.jpg"
		this.create(colectivo3)
		this.create(colectivo2)
		this.create(colectivo1)
		this.create(banco5)
		this.create(banco4)
		this.create(banco3)
		this.create(banco2)
		this.create(banco1)
		this.create(cgp3)
		this.create(cgp2)
		this.create(cgp1)
	}
	
	override addQueryByExample(Criteria criteria, Poi p) {
		if (p.nombre != null) {
			criteria.add(Restrictions.eq("nombre", p.nombre))
		}
	}
	
//	override addQueryByIdPoi(Criteria criteria, Integer id, Poi p) {
//		if (p.nombre != null) {
//			criteria.add(Restrictions.eq("Identificador", p.identificador))
//		}
//	}
	
	def addQueryByCriterio(Criteria criteria, List<String> criterios, String nombre){
		criterios.forEach[c | criteria.add(Restrictions.eq(c,nombre))]
//		criterios.forEach[c | 
//			criteria.add(Restrictions.disjunction
//				.add(Restrictions.in(nombre,c))
//			).setFetchMode("servicios",FetchMode.JOIN)
//		]
	}
	
//	override addQueryByIdUser(Criteria criteria, Integer id, Usuario user) {
//		throw new UnsupportedOperationException("TODO: auto-generated method stub")
//	}

def List<Poi> searchByCriterio(List<String> criterios) {
		var Poi p
		val session = openSession
		try {
			val criteria = session.createCriteria(Poi)
			this.addQueryByCriterio(criteria, criterios, p.nombre)
			return criteria.list()
		} catch (HibernateException e) {
			throw new RuntimeException(e)
		} finally {
			session.close
		}
	}
	

	
	
	
	
	
}
