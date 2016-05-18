package TestsDecoradores

import poi.Factories.PoiFactory
import poi.Factories.PointFactory
import poi.RepositorioPoi
import poi.TouchMe
import java.util.List
import org.junit.Before
import poi.BuscadorDePuntosService
import java.util.ArrayList
import org.junit.Test
import org.mockito.Mockito
import org.junit.Assert

class DecoradorReporteTotalesPorUsuario {
	PoiFactory poiFactory
	PointFactory pointFactory
	poi.BuscadorDePuntosService buscadorDePuntos
	RepositorioPoi repositoryMocked
	poi.DecoradorReporteTotalesPorUsuario decoradorReportesTotalesTouchMe1

	TouchMe touchMe1
	TouchMe touchMe2
	
	List<poi.Poi> aux



	@Before
	def void init()
	{
		pointFactory = new PointFactory()		
		buscadorDePuntos = new BuscadorDePuntosService		
		this.touchMe1 = new TouchMe(pointFactory.puntoCero, "terminalAbasto")
		touchMe2 = new TouchMe(pointFactory.puntoCero, "terminalPalermo")
		decoradorReportesTotalesTouchMe1 = new poi.DecoradorReporteTotalesPorUsuario(buscadorDePuntos, touchMe1)
		
		
		poiFactory = new PoiFactory()		
		aux = new ArrayList<poi.Poi>()
				
	}
	
	@Test
	def void testReporteTotalesPorUsuario() {		
		aux.add(poiFactory.libreria)
		aux.add(poiFactory.libreriaEscolar)
		aux.add(poiFactory.libreria)
		aux.add(poiFactory.libreriaEscolar)
		aux.add(poiFactory.libreria)
		aux.add(poiFactory.libreriaEscolar)
		
		repositoryMocked = Mockito.mock(RepositorioPoi)
		Mockito.when(repositoryMocked.BuscarPorTexto("libreria")).thenReturn(aux)
		buscadorDePuntos.poiRepository = repositoryMocked	
				
		// Reporte antes de buscar
		Assert.assertEquals(decoradorReportesTotalesTouchMe1.reporte.cantidadDeBusquedasDelUsuario(touchMe1), 0)
		// Busco librería
		decoradorReportesTotalesTouchMe1.BuscarPorTexto("libreria")
		Assert.assertEquals(decoradorReportesTotalesTouchMe1.reporte.cantidadDeBusquedasDelUsuario(touchMe1), 6)
		// Busco asdasdd
		decoradorReportesTotalesTouchMe1.BuscarPorTexto("asdasdd")
		Assert.assertEquals(decoradorReportesTotalesTouchMe1.reporte.cantidadDeBusquedasDelUsuario(touchMe1), 6)
		// Busco librería otra vez
		decoradorReportesTotalesTouchMe1.BuscarPorTexto("libreria")
		Assert.assertEquals(decoradorReportesTotalesTouchMe1.reporte.cantidadDeBusquedasDelUsuario(touchMe1), 12)
		
	}}