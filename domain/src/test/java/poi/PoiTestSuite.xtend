package poi

import org.junit.Test
import org.junit.Before
import org.uqbar.geodds.Point
import org.junit.Assert

class PoiTestSuite {

	var Poi punto

	@Before
	def void init() {
		punto = new ParadaColectivo(new Point(1, 2), "Punto 1")
	}

	@Test
	def void testPoiEsValido() {
		Assert.assertTrue(punto.EsValido())
	}

}
