package poi

import org.junit.Before
import org.junit.Test
import org.uqbar.geodds.Point
import org.junit.Assert

class BusquedaPorTextoLibreTestSuite {

	Poi paradaColectivo

	@Before
	def void init() {
		paradaColectivo = new Poi(new Point(1, 1), "Parada del 114")
		paradaColectivo.DefinirTipoDePoi(new ParadaColectivo())
		paradaColectivo.etiqueta = "Bondi"
	}

	@Test
	def void testEncuentraParadaPorTexto() {
		var textoLibre = "bondi"

		Assert.assertTrue(paradaColectivo.BusquedaPorTexto(textoLibre) == paradaColectivo)

		textoLibre = "114"

		Assert.assertTrue(paradaColectivo.BusquedaPorTexto(textoLibre) == paradaColectivo)

		textoLibre = "blabla"

		Assert.assertFalse(paradaColectivo.BusquedaPorTexto(textoLibre) == paradaColectivo)


	}
}
