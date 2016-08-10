package testsCommands

import org.junit.Before
import org.junit.Test
import poi.ConfiguracionErrorMail
import poi.ProcesoUno
import poi.RepositorioPoi

class ProcesoUnoTestSuite {
	ProcesoUno proceso1
	RepositorioPoi repositorio
	
	@Before
	def void init(){
		
			proceso1 = new ProcesoUno("nombreProceso", "Carrousel;colegio escolar uniformes modas", repositorio, new ConfiguracionErrorMail(""))		
	}
	
	@Test
	def void testEjecutaLosProcesosSimplesNoConsideraExcepcion(){
		
		proceso1.Ejecutar()
		
	}
}