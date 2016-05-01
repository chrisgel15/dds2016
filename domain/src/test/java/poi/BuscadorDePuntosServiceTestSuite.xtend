package poi

import org.junit.Before
import org.junit.Test
import poi.Factories.PoiFactory

class BuscadorDePuntosServiceTestSuite {
	RepositorioPoi repository

	@Before
	def void init() {
		val poiFactory = new PoiFactory()		
		repository = new RepositorioPoi()

		repository.create(poiFactory.cgp)
		repository.create(poiFactory.galicia)
		repository.create(poiFactory.kioscoDeLaEsquina)
		repository.create(poiFactory.libreria)
		repository.update(poiFactory.cgp)

	}

	@Test
	def void testRepository() {
		
		BuscadorDePuntosService.instance.BuscarPorTexto("banco")

	}}