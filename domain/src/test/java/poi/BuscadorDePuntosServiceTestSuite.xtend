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
	ServicioExternoCGP servicioCgpMocked
	PoiFactory poiFactory
	List<Poi> aux
	List<CGP> auxCgp
	List<Poi> returnList

	@Before
	def void init() {
		poiFactory = new PoiFactory()
		repositoryMocked = Mockito.mock(RepositorioPoi)
		servicioCgpMocked = Mockito.mock(ServicioExternoCGP)
		aux = new ArrayList<Poi>()
		auxCgp = new ArrayList<CGP>()
		BuscadorDePuntosService.instance.poiRepository = repositoryMocked
		BuscadorDePuntosService.instance.servicioExtCGP = servicioCgpMocked
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
		auxCgp.add(poiFactory.cgp)
		auxCgp.add(poiFactory.cgpAlmagro)
		Mockito.when(servicioCgpMocked.BuscarPorTexto("cgp")).thenReturn(auxCgp)
		
		returnList = BuscadorDePuntosService.instance.BuscarPorTexto("cgp")
		
		Assert.assertEquals(returnList.get(0), poiFactory.cgp)
		Assert.assertEquals(returnList.get(1), poiFactory.cgpAlmagro)
		Assert.assertEquals(returnList.size, 2)		
	}
	
}
