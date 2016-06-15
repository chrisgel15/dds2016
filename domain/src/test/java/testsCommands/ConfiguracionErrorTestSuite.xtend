package testsCommands

import org.junit.Assert
import org.junit.Before
import org.junit.Test
import org.mockito.Mockito
import poi.ConfiguracionErrorRepetir
import poi.ProcesoDos
import poi.ConfiguracionErrorMail

class ConfiguracionErrorTestSuite {

	ProcesoDos proceso2Mocked
	ConfiguracionErrorRepetir repetir
	ConfiguracionErrorMail mail

	@Before
	def void init() {
		proceso2Mocked = Mockito.mock(ProcesoDos)
	}

	@Test
	def void testRestaLaCantidadDeEjecucionesPendientes() {

		Mockito.doNothing().when(proceso2Mocked).Ejecutar()
		repetir = new ConfiguracionErrorRepetir(5)
		Assert.assertEquals(repetir.CantidadEjecuciones, 5)
		repetir.EjecucionAnteError(proceso2Mocked)
		Assert.assertEquals(repetir.CantidadEjecuciones, 4)
		repetir.EjecucionAnteError(proceso2Mocked)
		Assert.assertEquals(repetir.CantidadEjecuciones, 3)
		repetir.EjecucionAnteError(proceso2Mocked)
		Assert.assertEquals(repetir.CantidadEjecuciones, 2)
		repetir.EjecucionAnteError(proceso2Mocked)
		Assert.assertEquals(repetir.CantidadEjecuciones, 1)
		repetir.EjecucionAnteError(proceso2Mocked)
		Assert.assertEquals(repetir.CantidadEjecuciones, 0)
		repetir.EjecucionAnteError(proceso2Mocked)
		Assert.assertEquals(repetir.CantidadEjecuciones, 0)

		Mockito.verify(proceso2Mocked, Mockito.times(5)).Ejecutar()

	}
	
	@Test
	def void testEnvioMail() {

//TODO
//		Mockito.doNothing().when(proceso2Mocked).Ejecutar()
//		mail = new ConfiguracionErrorMail("mail@test")
//		mail.EjecucionAnteError(proceso2Mocked)		

	}
}
