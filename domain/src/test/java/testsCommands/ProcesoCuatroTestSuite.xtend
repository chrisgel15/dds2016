package testsCommands

import org.junit.Before
import org.junit.Test
import poi.ProcesoCuatro
import poi.ProcesoUno
import poi.ProcesoDos
import poi.ProcesoTres
import org.mockito.Mockito
import poi.ConfiguracionErrorMail
import poi.ProcesoDosServicioGCBAException

class ProcesoCuatroTestSuite {

	ProcesoCuatro proceso4
	ProcesoUno proceso1Mocked
	ProcesoDos proceso2Mocked
	ProcesoTres proceso3Mocked
	
	
	
	@Before
	def void init(){
		
		
		proceso1Mocked = Mockito.mock(ProcesoUno)
		proceso2Mocked = Mockito.mock(ProcesoDos)
		proceso3Mocked = Mockito.mock(ProcesoTres)
		proceso4 = new ProcesoCuatro("ProcesoCompuesto", new ConfiguracionErrorMail())	
		proceso4.IniciarProceso(proceso4.nombreProceso,"admin")	
	}
	
	@Test
	def void testEjecutaLosProcesosSimplesNoConsideraExcepcion(){
		
		proceso4.procesos=>[
			add(proceso1Mocked)
			add(proceso2Mocked)
			add(proceso3Mocked)
			]
			
		proceso4.Ejecutar()
		
		Mockito.verify(proceso1Mocked).Ejecutar()
		Mockito.verify(proceso2Mocked).Ejecutar()
		Mockito.verify(proceso3Mocked).Ejecutar()
		
	}
	
	@Test(expected = ProcesoDosServicioGCBAException) 
	def void testEjecutaLosProcesosSimplesEsperaExcepcion(){
		
		
		proceso4.procesos=>[
			add(proceso1Mocked)
			add(proceso2Mocked)
			add(proceso3Mocked)
			]
		proceso4.Ejecutar()
		
		proceso2Mocked.Ejecutar() throw new ProcesoDosServicioGCBAException("Error al ejecutar servicio externo")
	}
	
}