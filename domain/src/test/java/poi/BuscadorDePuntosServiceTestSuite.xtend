package poi

import org.junit.Before
import org.junit.Test
import poi.Factories.PoiFactory
import org.mockito.Mockito
import java.util.List
import java.util.ArrayList
import org.junit.Assert

class BuscadorDePuntosServiceTestSuite {
	RepositorioPoi repositoryMocked
	PoiFactory poiFactory
	List<Poi> aux
	List<Poi> returnList

	@Before
	def void init() {
		poiFactory = new PoiFactory()
		repositoryMocked = Mockito.mock(RepositorioPoi)
		aux = new ArrayList<Poi>()
		BuscadorDePuntosService.instance.poiRepository = repositoryMocked
	}

	@Test
	def void testDevuelveUnPoi() {
		// Preparo el resultado mockeado de un metodo que no quiero testear		
		aux.add(poiFactory.libreria)
		Mockito.when(repositoryMocked.BuscarPorTexto("libreria")).thenReturn(aux)
		// Fin	
		// Ejecuto el metodo que quiero testear, que debe retornar el resultado que mockee.
		returnList = BuscadorDePuntosService.instance.BuscarPorTexto("libreria")

		// Pruebo sobre lo que devolvio
		Assert.assertEquals(returnList.get(0), poiFactory.libreria)
		Assert.assertEquals(returnList.size, 1)

	}

	@Test
	def void testNoDevuelveNingunPoi() {
		Mockito.when(repositoryMocked.BuscarPorTexto("libreria")).thenReturn(aux)
		returnList = BuscadorDePuntosService.instance.BuscarPorTexto("libreria")
		Assert.assertEquals(returnList.size, 0)
	}
	
	@Test
	def void testDevuelveDosCGP()
	{					
		aux.add(poiFactory.cgp)
		aux.add(poiFactory.cgpAlmagro)
		Mockito.when(repositoryMocked.BuscarPorTexto("cgp")).thenReturn(aux)
		
		returnList = BuscadorDePuntosService.instance.BuscarPorTexto("cgp")
		
		Assert.assertEquals(returnList.get(0), poiFactory.cgp)
		Assert.assertEquals(returnList.get(1), poiFactory.cgpAlmagro)
		Assert.assertEquals(returnList.size, 2)		
	}
	
}
