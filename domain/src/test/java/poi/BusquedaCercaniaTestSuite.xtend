package poi

import org.junit.Before
import org.junit.Test
import org.junit.Assert
import org.uqbar.geodds.Point

class BusquedaCercaniaTestSuite {

	CGP CGP

	Point puntoVertice1

	Point puntoVertice2

	Point puntoVertice3

	TouchMe touchMe

	@Before
	def void init() {
		puntoVertice1 = new Point(-34.534645, -58.465027) // Av. Lugones y Gral.Paz
		puntoVertice2 = new Point(-34.566598, -58.471550) // Blanco Encalada 3500
		puntoVertice3 = new Point(-34.561650, -58.442024) // Av.Del Libertador 1600
		CGP = new CGP(new Point(-34.553935, -58.463992), "CGP 1",
			new Comuna("Comuna 2", puntoVertice1, puntoVertice2, puntoVertice3))

		touchMe = new TouchMe(new Point(-34.553936, -58.463991), "touch meee")
	}

	@Test
	def void testPoiEsValido() {
		Assert.assertTrue(CGP.ConsultaCercania(touchMe))
	}

}
