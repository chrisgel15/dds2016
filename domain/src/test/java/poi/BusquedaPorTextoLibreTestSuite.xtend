package poi

import org.junit.Assert
import org.junit.Before
import org.junit.Test
import poi.Factories.PoiFactory

class BusquedaPorTextoLibreTestSuite {

	PoiFactory poiFactory

	@Before
	def void init() {
		poiFactory = new PoiFactory()
	}

	@Test
	def void testEncuentraParadaPorTexto() {
		var textoLibre = "bondi"

		Assert.assertTrue(poiFactory.parada114.BusquedaPorTexto(textoLibre))

		textoLibre = "114"

		Assert.assertTrue(poiFactory.parada114.BusquedaPorTexto(textoLibre))

		textoLibre = "blabla"

		Assert.assertFalse(poiFactory.parada114.BusquedaPorTexto(textoLibre))

	}

	@Test
	def void testEncuentraLocalPorRubro() {
		var textoLibre = "busco por rubro libreria"

		Assert.assertTrue(poiFactory.libreriaEscolar.BusquedaPorTexto(textoLibre))

		textoLibre = "busco por otra cosa"

		Assert.assertFalse(poiFactory.libreriaEscolar.BusquedaPorTexto(textoLibre))
	}

	@Test
	def void testEncuentraCGPPorTexto() {
		var textoLibre = "comuna_almagro"

		Assert.assertTrue(poiFactory.cgpAlmagro.BusquedaPorTexto(textoLibre))

		textoLibre = "comuna_caballito"

		Assert.assertFalse(poiFactory.cgpAlmagro.BusquedaPorTexto(textoLibre))
	}

	@Test
	def void testEncuentraBancoPorTexto() {
		var textoLibre = "banco_nacion"

		Assert.assertTrue(poiFactory.banco_nacion.BusquedaPorTexto(textoLibre))

		textoLibre = "provincia"

		Assert.assertFalse(poiFactory.banco_nacion.BusquedaPorTexto(textoLibre))
	}

	@Test
	def void testEncuentraPorclave() {
		var clave = "Bondi"

		Assert.assertTrue(poiFactory.parada114.BusquedaEtiqueta(clave))
		Assert.assertFalse(poiFactory.libreriaEscolar.BusquedaEtiqueta(clave))
		Assert.assertFalse(poiFactory.cgpAlmagro.BusquedaEtiqueta(clave))
		Assert.assertFalse(poiFactory.banco_nacion.BusquedaEtiqueta(clave))
	}
}
