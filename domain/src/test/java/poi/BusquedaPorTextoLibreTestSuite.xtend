package poi

import org.junit.Before
import org.junit.Test
import org.uqbar.geodds.Point
import org.junit.Assert
import org.joda.time.DateTime

class BusquedaPorTextoLibreTestSuite {

	Poi paradaColectivo
	Poi libreriaEscolar
	DateTime inicio
	DateTime fin
	HorarioDeAtencion horario

	@Before
	def void init() {
		paradaColectivo = new ParadaColectivo(new Point(1, 1), "Parada del 114")
		paradaColectivo.etiqueta = "Bondi"
		horario = new HorarioDeAtencion(1, 9, 18)
		libreriaEscolar = new LibreriaEscolar(new Point(1, 1), "Cuspide", horario, "rubro Libreria")
		inicio = new DateTime(2010, 1, 1, 0, 0, 0, 0)
		fin = new DateTime(2010, 1, 1, 0, 0, 0, 0)

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
