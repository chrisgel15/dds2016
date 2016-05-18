package TestsDecoradores

import java.util.ArrayList
import java.util.List
import org.junit.Assert
import org.junit.Before
import org.junit.Test
import org.mockito.Mockito
import poi.BuscadorDePuntosService
import poi.DecoradorReporteBusquedaPorTerminal
import poi.Factories.PoiFactory
import poi.Factories.PointFactory
import poi.Poi
import poi.RepositorioPoi
import poi.TouchMe

class DecoradorReporteBusquedaPorTerminalTestSuite {
	PoiFactory poiFactory
	PointFactory pointFactory
	BuscadorDePuntosService buscadorDePuntos
	RepositorioPoi repositoryMocked
	DecoradorReporteBusquedaPorTerminal decoradorReporteBusquedaTerminal
	TouchMe touchMe
	
	List<Poi> aux


	@Before
	def void init()
	{
		pointFactory = new PointFactory()		
		buscadorDePuntos = new BuscadorDePuntosService		
		this.touchMe = new TouchMe(pointFactory.puntoCero, "terminalAbasto")
		decoradorReporteBusquedaTerminal = new DecoradorReporteBusquedaPorTerminal(buscadorDePuntos, touchMe)
		
		poiFactory = new PoiFactory()		
		aux = new ArrayList<Poi>()			
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