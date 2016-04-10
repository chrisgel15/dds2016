package poi

import org.junit.Before
import org.uqbar.geodds.Point
import org.junit.Test
import org.junit.Assert

class ParadaColectivoTestSuite {

	Poi origen

	Poi destinoLejano

	Poi destinoCercano

	@Before
	def void init() {
		origen = new Poi(new Point(-34.644997, -58.564860), "Ubicacion Touch.Me")
		destinoCercano = new Poi(new Point(-34.644997, -58.565000), "Parada del 28 cercana")
		destinoCercano.DefinirTipoDePoi(new ParadaColectivo())

		destinoLejano = new Poi(new Point(-34.644997, -58.574860), "Parada del 28 lejana")
		destinoLejano.DefinirTipoDePoi(new ParadaColectivo())
	}

	@Test
	def void testLaParadaEstaCerca() {
		Assert.assertTrue(destinoCercano.ConsultaCercania(origen))
	}

	@Test
	def void testLaParadaEstaLejos() {
		Assert.assertFalse(destinoLejano.ConsultaCercania(origen))
	}

}
