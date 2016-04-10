package poi

import org.junit.Before
import org.junit.Test
import org.uqbar.geodds.Point
import org.junit.Assert

class BusquedaPorTextoLibreTestSuite {

	Poi paradaColectivo
	Poi libreriaEscolar

	@Before
	def void init() {
		paradaColectivo = new Poi(new Point(1, 1), "Parada del 114")
		paradaColectivo.DefinirTipoDePoi(new ParadaColectivo())
		paradaColectivo.etiqueta = "Bondi"

		libreriaEscolar = new Poi(new Point(1, 1), "Cuspide")
		libreriaEscolar.DefinirTipoDePoi(new LibreriaEscolar("rubro Libreria"))
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

	@Test
	def void testEncuentraLocalPorRubro() {
		var textoLibre = "busco por rubro libreria"

		Assert.assertTrue(libreriaEscolar.BusquedaPorTexto(textoLibre) == libreriaEscolar)

		textoLibre = "busco por otra cosa"

		Assert.assertFalse(libreriaEscolar.BusquedaPorTexto(textoLibre) == libreriaEscolar)
	}
}
