package testsCommands

import poi.ProcesoDos
import org.junit.Before
import org.junit.Test
import poi.ConfiguracionErrorNoHacerNada
import poi.Factories.PoiFactory
import poi.RepositorioPoi
import java.util.List
import poi.BajaPois
import java.util.ArrayList
import poi.Poi
import org.junit.Assert

class ProcesoDosTestSuite {

	PoiFactory poiFactory
	ProcesoDos proceso2
	RepositorioPoi repository
	BajaPois bajaPoi

	@Before
	def void init() {
		proceso2 = new ProcesoDos("nombre Proceso", new ConfiguracionErrorNoHacerNada())

		poiFactory = new PoiFactory()
		repository = poiFactory.poiRepository
	}

	@Test
	def void BuscaYEliminaPois() {

		var List<Poi> aux;
		bajaPoi = new BajaPois(poiFactory.cgp.nombre, "17-06-2016")
		proceso2.poiRepository = repository

		aux = repository.BuscarPorTexto(bajaPoi.valorDeBusqueda)

		Assert.assertTrue(aux.length > 0)

		proceso2.EliminaPoi(bajaPoi)

		aux = repository.BuscarPorTexto(bajaPoi.valorDeBusqueda)

		Assert.assertEquals(0, aux.length )

	}
}
