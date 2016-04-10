package poi

import org.uqbar.geodds.Point
import org.junit.Before
import org.junit.Test
import org.junit.Assert

class ComunaTestSuite {

	var Point puntoInside
	var Point puntoVertice1
	var Point puntoVertice2
	var Point puntoVertice3

	var Comuna comuna

	Point puntoOut

	@Before
	def void init() {
		puntoInside = new Point(-34.644997, -58.564860)

		puntoVertice1 = new Point(-34.646683, -58.567499)
		puntoVertice2 = new Point(-34.645377, -58.559935)
		puntoVertice3 = new Point(-34.641811, -58.565525)

		puntoOut = new Point(-34.642217, -58.555665)

		comuna = new Comuna("Comuna Test", puntoVertice1, puntoVertice2, puntoVertice3)
	}

	@Test
	def void testEstaDentroDeComuna() {
		Assert.assertTrue(comuna.PertenecePoint(puntoInside))
	}

	@Test
	def void testEstaFueraDecomuna() {
		Assert.assertFalse((comuna.PertenecePoint(puntoOut)))
	}

}
