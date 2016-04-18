package poi

import org.junit.Before
import org.junit.Test
import org.uqbar.geodds.Point
import org.junit.Assert
import org.joda.time.DateTime

class BusquedaPorTextoLibreTestSuite {

	Poi paradaColectivo
	Poi libreriaEscolar
	Poi CGP
	Poi banco_nacion
	DateTime inicio
	DateTime fin
	HorarioDeAtencion horario
	Point punto1
	Comuna comuna_almagro
	
	@Before
	def void init() {
		paradaColectivo = new ParadaColectivo(new Point(1, 1), "Parada del 114")
		paradaColectivo.etiqueta = "Bondi"
		horario = new HorarioDeAtencion(1, 9, 18)
		libreriaEscolar = new LibreriaEscolar(new Point(1, 1), "Cuspide", horario, "rubro Libreria")
		libreriaEscolar.etiqueta = "Libro" 
		inicio = new DateTime(2010, 1, 1, 0, 0, 0, 0)
		fin = new DateTime(2010, 1, 1, 0, 0, 0, 0)
		punto1 = new Point(1,2)
		comuna_almagro = new Comuna("comuna_almagro",punto1,punto1,punto1)
		CGP = new CGP(punto1,"almagro",comuna_almagro)
		CGP.etiqueta = "Gestion"
		banco_nacion = new Banco(punto1,"banco_nacion")
		banco_nacion.etiqueta = "Banco" 
	}

	@Test
	def void testEncuentraParadaPorTexto() {
		var textoLibre = "bondi"

		Assert.assertTrue(paradaColectivo.BusquedaPorTexto(textoLibre) == paradaColectivo)

		textoLibre = "114"

		Assert.assertEquals(paradaColectivo.BusquedaPorTexto(textoLibre), paradaColectivo)

		textoLibre = "blabla"

		Assert.assertNull(paradaColectivo.BusquedaPorTexto(textoLibre))

	}

	@Test
	def void testEncuentraLocalPorRubro() {
		var textoLibre = "busco por rubro libreria"

		Assert.assertTrue(libreriaEscolar.BusquedaPorTexto(textoLibre) == libreriaEscolar)

		textoLibre = "busco por otra cosa"

		Assert.assertFalse(libreriaEscolar.BusquedaPorTexto(textoLibre) == libreriaEscolar)
	}
	
	@Test
	def void testEncuentraCGPPorTexto(){
		var textoLibre = "comuna_almagro"
		
		Assert.assertTrue(CGP.BusquedaPorTexto(textoLibre) == CGP)
		
		textoLibre = "comuna_caballito"
		
		Assert.assertFalse(CGP.BusquedaPorTexto(textoLibre) == CGP)
	}
	
	@Test
	def void testEncuentraBancoPorTexto(){
		var textoLibre = "banco_nacion"
		
		Assert.assertTrue(banco_nacion.BusquedaPorTexto(textoLibre) == banco_nacion)
		
		textoLibre = "provincia"
		
		Assert.assertFalse(banco_nacion.BusquedaPorTexto(textoLibre) == banco_nacion)
	}
	
	@Test
	def void testEncuentraPorclave(){
		var clave = "Bondi"
		
		Assert.assertTrue(paradaColectivo.BusquedaEtiqueta(clave) == paradaColectivo)
		Assert.assertFalse(libreriaEscolar.BusquedaEtiqueta(clave) == libreriaEscolar)
		Assert.assertFalse(CGP.BusquedaEtiqueta(clave) == CGP)
		Assert.assertFalse(banco_nacion.BusquedaEtiqueta(clave) == banco_nacion)
	}
}
