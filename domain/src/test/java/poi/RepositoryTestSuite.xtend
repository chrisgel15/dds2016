package poi

import org.junit.Before
import org.junit.Test
import org.junit.Assert

class RepositoryTestSuite {

	RepositorioPoi repository

	@Before
	def void init() {
		val poiFactory = new PoiFactory()
		poiFactory.crearPois()
		repository = new RepositorioPoi()

		repository.create(poiFactory.CGP)
		repository.create(poiFactory.galicia)
		repository.create(poiFactory.kiosco)
		repository.create(poiFactory.libreria)
		repository.update(poiFactory.CGP)

	}

	@Test
	def void testRepository() {
		
		Assert.assertTrue(this.repository.objects.length == 4)
		
		var lista = this.repository.search("banco")
		
		Assert.assertTrue(lista.length == 1)
		
		lista = this.repository.search("social")
		
		Assert.assertTrue(lista.length == 1)
		
		lista = this.repository.search("asdfsdf")
		
		Assert.assertTrue(lista.length == 0)

	}
}
