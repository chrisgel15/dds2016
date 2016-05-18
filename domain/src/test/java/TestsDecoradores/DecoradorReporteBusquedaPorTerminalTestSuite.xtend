package TestsDecoradores

import poi.Factories.PoiFactory
import poi.Factories.PointFactory
import poi.RepositorioPoi
import poi.DecoradorAlmacenamientoResultados
import poi.TouchMe
import java.util.List
import org.junit.Before
import poi.BuscadorDePuntosService
import java.util.ArrayList
import org.junit.Test
import org.mockito.Mockito
import org.junit.Assert
import poi.DecoradorReporteBusquedaPorTerminal

class DecoradorReporteBusquedaPorTerminalTestSuite {
	PoiFactory poiFactory
	PointFactory pointFactory
	poi.BuscadorDePuntosService buscadorDePuntos
	RepositorioPoi repositoryMocked
	DecoradorReporteBusquedaPorTerminal decoradorReporteBusquedaTerminal
	TouchMe touchMe
	
	List<poi.Poi> aux


	@Before
	def void init()
	{
		pointFactory = new PointFactory()		
		buscadorDePuntos = new BuscadorDePuntosService		
		this.touchMe = new TouchMe(pointFactory.puntoCero, "terminalAbasto")
		decoradorReporteBusquedaTerminal = new poi.DecoradorReporteBusquedaPorTerminal(buscadorDePuntos, touchMe)
		
		poiFactory = new PoiFactory()		
		aux = new ArrayList<poi.Poi>()			
	}
	
	@Test
	def void testGuardaLaBusquedaYLaFecha() {		
		aux.add(poiFactory.libreria)
		aux.add(poiFactory.libreriaEscolar)
		aux.add(poiFactory.libreria)
		aux.add(poiFactory.libreriaEscolar)
		
		
		repositoryMocked = Mockito.mock(RepositorioPoi)
		Mockito.when(repositoryMocked.BuscarPorTexto("libreria")).thenReturn(aux)
		buscadorDePuntos.poiRepository = repositoryMocked	
				
		decoradorReporteBusquedaTerminal.BuscarPorTexto("libreria")	
		
		// Pruebo sobre lo que devolvio
		Assert.assertEquals(decoradorReporteBusquedaTerminal.terminal, this.touchMe)
		Assert.assertEquals(decoradorReporteBusquedaTerminal.resultadosParciales.get(0), 4)
				
		decoradorReporteBusquedaTerminal.BuscarPorTexto("libreria")	
		
		// Pruebo sobre lo que devolvio
		Assert.assertEquals(decoradorReporteBusquedaTerminal.terminal, this.touchMe)
		Assert.assertEquals(decoradorReporteBusquedaTerminal.resultadosParciales.get(1), 4)
		
		decoradorReporteBusquedaTerminal.BuscarPorTexto("asdfasdf")	
		
		// Pruebo sobre lo que devolvio
		Assert.assertEquals(decoradorReporteBusquedaTerminal.terminal, this.touchMe)
		Assert.assertEquals(decoradorReporteBusquedaTerminal.resultadosParciales.get(2), 0)
	
	}
}