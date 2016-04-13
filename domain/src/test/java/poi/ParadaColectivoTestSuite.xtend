package poi

import org.junit.Before
import org.uqbar.geodds.Point
import org.junit.Test
import org.junit.Assert

class ParadaColectivoTestSuite {

	TouchMe touchMe
	ParadaColectivo colectivoLinea28
	ParadaColectivo otroColectivoLinea28	
	ParadaColectivo colectivoLinea114
	ParadaColectivo otroColectivoLinea114

	@Before
	def void init() {
		touchMe = new TouchMe(new Point(-34.589128, -58.410009), "Touch.Me en Sta.Fe y Cnel.Diaz")
		colectivoLinea28 = new ParadaColectivo(new Point(-34.550513, -58.499996), "Av.Gral.Paz y Balbin")
		otroColectivoLinea28 = new ParadaColectivo(new Point(-34.634487, -58.529944), "Liniers")
		colectivoLinea114 = new ParadaColectivo(new Point(-34.581020, -58.493649), "Av.Mosconi y Av.Constituyentes")
		otroColectivoLinea114 = new ParadaColectivo(new Point(-34.558240, -58.459838), "Av.Monroe y Av.Cabildo")
	}

	@Test
	def void testLaParadaDel28EstaCerca() {
		Assert.assertFalse(colectivoLinea28.ConsultaCercania(touchMe))
	}

	@Test
	def void testLaParadaDel28EstaLejos() {
		Assert.assertTrue(!otroColectivoLinea28.ConsultaCercania(touchMe))
	}
	
	@Test
	def void testLaParadaDel114EstaCerca() {
		Assert.assertFalse(colectivoLinea114.ConsultaCercania(touchMe))
	}

	@Test
	def void testLaParadaDel114EstaLejos() {
		Assert.assertTrue(!otroColectivoLinea114.ConsultaCercania(touchMe))
	}

}
