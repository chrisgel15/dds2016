package testsCommands

import org.junit.Before
import org.junit.Test
import poi.ProcesoCuatro
import poi.ProcesoUno
import poi.ProcesoDos
import poi.ProcesoTres
import org.mockito.Mockito
import poi.ConfiguracionErrorMail

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
		proceso4 = new ProcesoCuatro("nombre Proceso", new ConfiguracionErrorMail(""))		
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
}