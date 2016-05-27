package TestsDecoradores

import poi.Factories.PoiFactory
import poi.Factories.PointFactory
import poi.RepositorioPoi
import poi.DecoradorNotificadorAdmin
import poi.TouchMe
import java.util.List
import org.junit.Before
import poi.BuscadorDePuntosService
import java.util.ArrayList
import org.mockito.Mockito
import org.junit.Test
import org.junit.Assert

class DecoradorNotificadorAdminTestSuite {
	PoiFactory poiFactory
	PointFactory pointFactory
	poi.BuscadorDePuntosService buscadorDePuntos
	RepositorioPoi repositoryMocked
	DecoradorNotificadorAdmin decoradorNotificador
	TouchMe touchMe
	
	List<poi.Poi> aux


	@Before
	def void init()
	{
		pointFactory = new PointFactory()		
		buscadorDePuntos = new BuscadorDePuntosService		
		this.touchMe = new TouchMe(pointFactory.puntoCero, "terminalAbasto")
		//tiempo de repuesta maximo -1
		decoradorNotificador = new poi.DecoradorNotificadorAdmin(buscadorDePuntos, -1)
		
		poiFactory = new PoiFactory()		
		aux = new ArrayList<poi.Poi>()			
	}
	
	@Test
	def void testEnvioAlAdministrador() {		
		aux.add(poiFactory.libreria)
		aux.add(poiFactory.libreriaEscolar)
		aux.add(poiFactory.libreria)
		aux.add(poiFactory.libreriaEscolar)
		aux.add(poiFactory.libreria)
		aux.add(poiFactory.libreriaEscolar)
		
		repositoryMocked = Mockito.mock(RepositorioPoi)
		Mockito.when(repositoryMocked.BuscarPorTexto("libreria")).thenReturn(aux)
		buscadorDePuntos.poiRepository = repositoryMocked	
				
		decoradorNotificador.BuscarPorTexto("libreria")	
		
		// Pruebo sobre lo que devolvio
		Assert.assertEquals(decoradorNotificador.enviosAlAdministrador, 1)
		// Tiempo de respuesta maximo 0
		decoradorNotificador = new poi.DecoradorNotificadorAdmin(buscadorDePuntos, 0)
		// Pruebo sobre lo que devolvio
		Assert.assertEquals(decoradorNotificador.enviosAlAdministrador, 0)
	}
}