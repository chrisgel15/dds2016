package poi

import org.junit.Before
import org.junit.Test
import org.junit.Assert
import org.uqbar.geodds.Point
import poi.Factories.PointFactory
import poi.Factories.PoiFactory
import poi.Factories.ComunaFactory

class BusquedaCercaniaTestSuite {

	TouchMe touchMe
	TouchMe touchMe2

	PointFactory coordenadaFactory
	PoiFactory poiFactory
	ComunaFactory comunaFactory
	

	@Before
	def void init() {
		poiFactory = new PoiFactory()
		comunaFactory = new ComunaFactory
		coordenadaFactory = new PointFactory
		touchMe2 = new TouchMe(new Point(-34.598748, -58.375412), "Touch.Me en Av.Cordoba y Florida")
		touchMe = new TouchMe(new Point(-34.553936, -58.463991), "touch meee")
	}
	
/***********Distancias a CGP ***********/	
	
	 @Test
		def void testEstaCercaDeCgp(){
			//Assert.assertFalse(CGP.ConsultaCercania(touchMe2))
			Assert.assertFalse(poiFactory.cgp.ConsultaCercania(touchMe2))
		}
		
		@Test
		def void testEstaLejosDeCgp(){
			//Assert.assertTrue(!CGP.ConsultaCercania(touchMe2))
			Assert.assertTrue(!poiFactory.cgp.ConsultaCercania(touchMe2))
		}
		
/**************************************** */
		
		

/*********** Distancias respecto a la Comuna ***********/
	@Test
	def void testEstaDentroDeComuna() {
		Assert.assertTrue(comunaFactory.comuna13.PertenecePoint(coordenadaFactory.puntoInside))
	}
	
	@Test
	def void testEstaFueraDecomuna() {
		Assert.assertFalse(comunaFactory.comuna13.PertenecePoint(coordenadaFactory.puntoOut))
	}
	
	@Test
	def void testEstaCercaDeCgp13() {
		Assert.assertTrue(comunaFactory.comuna13.AmbosPuntosPertenecen(coordenadaFactory.puntoTouchMe,coordenadaFactory.puntoCgp13))
	}
	
/***********************************************************/

	
/*********** Distancias a Locales Comerciales ***********/	
	@Test
	def void testEstaCercaDeLibreriaEscolar(){
		Assert.assertTrue(!poiFactory.otraLibreria.ConsultaCercania(touchMe))
	}
	
	@Test
	def void testEstaLejosDeLibreriaEscolar(){
		Assert.assertFalse(poiFactory.libreria.ConsultaCercania(touchMe))
	}
	
	@Test
	def void testEstaCercaDeKioscoDeDiario(){
		Assert.assertFalse(poiFactory.kioscoDeLaEsquina.ConsultaCercania(touchMe))
	}
	
	@Test
	def void testEstaLejosDeKioscoDeDiario(){
		Assert.assertTrue(!poiFactory.otroKiosco.ConsultaCercania(touchMe))
	}
	
/**************************************************************************/

	
/*********** Distancias a Paradas de Colectivo ***********/	
	@Test
	def void testLaParadaDel28EstaCerca() {
		Assert.assertFalse(poiFactory.parada28.ConsultaCercania(touchMe))
	}

	@Test
	def void testLaParadaDel28EstaLejos() {
		Assert.assertTrue(!poiFactory.otroColectivoLinea28.ConsultaCercania(touchMe))
	}
	
	@Test
	def void testLaParadaDel114EstaCerca() {
		Assert.assertFalse(poiFactory.parada114.ConsultaCercania(touchMe))
	}

	@Test
	def void testLaParadaDel114EstaLejos() {
		Assert.assertTrue(!poiFactory.otroColectivoLinea114.ConsultaCercania(touchMe))
	}
	
/****************************************************************/

	@Test
	def void testGgpEsValido() {
		Assert.assertTrue(poiFactory.cgp.EsValido)
		}

	@Test
	def void testPoiEsValido() {
		Assert.assertTrue(poiFactory.cgp.ConsultaCercania(touchMe))
	}

}
