package poi

import org.junit.Assert
import org.junit.Before
import org.junit.Test
import poi.Factories.PoiFactory

class RepositoryTestSuite {

	RepositorioPoi repository

	@Before
	def void init() {
		val poiFactory = new PoiFactory()
		repository = RepositorioPoi.instance

		repository.create(poiFactory.cgp)
		repository.create(poiFactory.banco_nacion)
		repository.create(poiFactory.galicia)
		repository.create(poiFactory.kioscoDeLaEsquina)
		repository.create(poiFactory.libreria)
		repository.update(poiFactory.cgp)

	}

	@Test
	def void testRepository() {

		Assert.assertEquals(this.repository.objects.size, 5)

		var lista = this.repository.search("banco")
		Assert.assertEquals(lista.size, 2)

		lista = this.repository.search("social")
		Assert.assertEquals(lista.size, 1)

		lista = this.repository.search("asdfsdf")
		Assert.assertEquals(lista.size, 0)

	}

}
