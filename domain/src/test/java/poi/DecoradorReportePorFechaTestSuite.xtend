package poi

import java.util.ArrayList
import java.util.List
import org.joda.time.LocalDate
import org.junit.Assert
import org.junit.Before
import org.junit.Test
import org.mockito.Mockito
import poi.Factories.PoiFactory

class DecoradorReportePorFechaTestSuite {
	
	PoiFactory poiFactory
	BuscadorDePuntosService buscadorDePuntosMocked
	DecoradorReportePorFecha decoradorFecha
	
	List<Poi> aux
	List<CGP> auxCgp

	@Before
	def void init()
	{
		buscadorDePuntosMocked = Mockito.mock(BuscadorDePuntosService)		
		decoradorFecha = new DecoradorReportePorFecha(buscadorDePuntosMocked)
		
		poiFactory = new PoiFactory()		
		aux = new ArrayList<Poi>()
		auxCgp = new ArrayList<CGP>()		
	}
	
	@Test
	def void testGuardaLaBusquedaYLaFecha() {		
		aux.add(poiFactory.libreria)
		aux.add(poiFactory.libreriaEscolar)
		Mockito.when(buscadorDePuntosMocked.BuscarPorTexto("libreria")).thenReturn(aux)
		
		decoradorFecha.BuscarPorTexto("libreria")	
		
		// Pruebo sobre lo que devolvio
		Assert.assertEquals(decoradorFecha.busquedasPorFecha.size, 1)
		Assert.assertEquals(decoradorFecha.busquedasPorFecha.get(new LocalDate()), 1)
		
		decoradorFecha.BuscarPorTexto("libreria")	
		
		// Pruebo sobre lo que devolvio
		Assert.assertEquals(decoradorFecha.busquedasPorFecha.size, 1)
		Assert.assertEquals(decoradorFecha.busquedasPorFecha.get(new LocalDate()), 2)		
		
		decoradorFecha.BuscarPorTexto("asdfasdf")	
		
		// Pruebo sobre lo que devolvio
		Assert.assertEquals(decoradorFecha.busquedasPorFecha.size, 1)
		Assert.assertEquals(decoradorFecha.busquedasPorFecha.get(new LocalDate()), 3)			

	}
	

}