package TestsDecoradores

import poi.Factories.PoiFactory
import java.util.List
import org.junit.Before
import org.junit.Test
import org.junit.Assert
import org.mockito.Mockito
import poi.DecoradorAlmacenamientoResultados
import java.util.ArrayList
import poi.TouchMe
import poi.Factories.PointFactory
import poi.RepositorioPoi
import poi.BuscadorDePuntosService

class DecoradorAlmacenamientoResultadosTestSuite {
	
	PoiFactory poiFactory
	PointFactory pointFactory
	poi.BuscadorDePuntosService buscadorDePuntos
	RepositorioPoi repositoryMocked
	DecoradorAlmacenamientoResultados decoradorAlmacenamiento
	TouchMe touchMe
	
	List<poi.Poi> aux


	@Before
	def void init()
	{
		pointFactory = new PointFactory()		
		buscadorDePuntos = new BuscadorDePuntosService		
		this.touchMe = new TouchMe(pointFactory.puntoCero, "terminalAbasto")
		decoradorAlmacenamiento = new poi.DecoradorAlmacenamientoResultados(buscadorDePuntos)
		
		poiFactory = new PoiFactory()		
		aux = new ArrayList<poi.Poi>()			
	}
	
	@Test
	def void testGuardaLaBusquedaYLaFecha() {		
		aux.add(poiFactory.libreria)
		aux.add(poiFactory.libreriaEscolar)
		aux.add(poiFactory.libreria)
		aux.add(poiFactory.libreriaEscolar)
		aux.add(poiFactory.libreria)
		aux.add(poiFactory.libreriaEscolar)
		
		repositoryMocked = Mockito.mock(RepositorioPoi)
		Mockito.when(repositoryMocked.BuscarPorTexto("libreria")).thenReturn(aux)
		buscadorDePuntos.poiRepository = repositoryMocked	
				
		decoradorAlmacenamiento.BuscarPorTexto("libreria")	
		
		// Pruebo sobre lo que devolvio
		Assert.assertEquals(decoradorAlmacenamiento.cantidadDeBusquedas, 1)
		
		decoradorAlmacenamiento.BuscarPorTexto("libreria")	
		
		// Pruebo sobre lo que devolvio
		Assert.assertEquals(decoradorAlmacenamiento.cantidadDeBusquedas, 2)
		
				
	}
}