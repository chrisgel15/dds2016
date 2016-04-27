package poi

import org.junit.Before
import org.junit.Test
import org.junit.Assert
import org.uqbar.geodds.Point

class BusquedaCercaniaTestSuite {

	TouchMe touchMe
	TouchMe touchMe2
	
	CGP CGP
	Comuna comuna13
	
	LocalComercial libreria
	LocalComercial otraLibreria
	LocalComercial kiosco
	LocalComercial otroKiosco
	
	HorarioDeAtencion horarioLibreria
	HorarioDeAtencion horarioKiosco
	
	IRubro rubroLibreria
	IRubro rubroKiosco
	
	ParadaColectivo colectivoLinea28
	ParadaColectivo otroColectivoLinea28	
	ParadaColectivo colectivoLinea114
	ParadaColectivo otroColectivoLinea114
	
	PointFactory coordenada
	
	

	@Before
	def void init() {
		
		coordenada = new PointFactory()
		coordenada.cargaDeCoordenada()
		
		
		comuna13 = new Comuna("Comuna13 Test", coordenada.puntoVertice1, coordenada.puntoVertice2, coordenada.puntoVertice3)
		
		CGP = new CGP(coordenada.puntoCgp, "CGP 13",comuna13)

		touchMe = new TouchMe(new Point(-34.553936, -58.463991), "touch meee")
		
		touchMe2 = new TouchMe(new Point(-34.598748, -58.375412), "Touch.Me en Av.Cordoba y Florida")
		
		rubroLibreria = new LibreriaEscolar("Libreria")

		rubroKiosco = new KioscoDiarios("Kiosco")

		kiosco = new LocalComercial(coordenada.puntoKiosco, "Lo de Pepe",horarioKiosco=new HorarioDeAtencion(1,6,15),rubroKiosco) // Av. Rivadavia 5800

		otroKiosco = new LocalComercial(coordenada.puntoOtroKiosco, "Cachos",horarioKiosco=new HorarioDeAtencion(1,6,17),rubroKiosco) //Av. Cabildo 2200

		libreria = new LocalComercial(coordenada.puntoLibreria, "LosPibes",horarioLibreria=new HorarioDeAtencion(7,9,18),rubroLibreria) //Av.Santa Fe 1800

		otraLibreria = new LocalComercial(coordenada.puntoOtraLibreria,"Lilita",horarioLibreria=new HorarioDeAtencion(5,9,18),rubroLibreria) //Av. Cabildo 1800

		colectivoLinea28 = new ParadaColectivo(coordenada.puntoParada28, "Av.Gral.Paz y Balbin")

		otroColectivoLinea28 = new ParadaColectivo(coordenada.puntoOtraParada28, "Liniers")

		colectivoLinea114 = new ParadaColectivo(coordenada.puntoParada114, "Av.Mosconi y Av.Constituyentes")

		otroColectivoLinea114 = new ParadaColectivo(coordenada.puntoOtraParada114, "Av.Monroe y Av.Cabildo")
	}
	
/***********Distancias a CGP ***********/	
	
	 @Test
		def void testEstaCercaDeCgp(){
			Assert.assertFalse(CGP.ConsultaCercania(touchMe2))
		}
		
		@Test
		def void testEstaLejosDeCgp(){
			Assert.assertTrue(!CGP.ConsultaCercania(touchMe2))
		}
		
/**************************************** */
		
		

/*********** Distancias respecto a la Comuna ***********/
	@Test
	def void testEstaDentroDeComuna() {
		
		Assert.assertTrue(comuna13.PertenecePoint(coordenada.puntoInside))
	}
	
	@Test
	def void testEstaFueraDecomuna() {
		
		Assert.assertFalse((comuna13.PertenecePoint(coordenada.puntoOut)))
	}
	
	@Test
	def void testEstaCercaDeCgp13() {
		
		Assert.assertTrue(comuna13.AmbosPuntosPertenecen(coordenada.puntoTouchMe,coordenada.puntoCgp13))
		
	}
	
/***********************************************************/

	
/*********** Distancias a Locales Comerciales ***********/	
	@Test
	def void testEstaCercaDeLibreriaEscolar(){
		
		Assert.assertTrue(!otraLibreria.ConsultaCercania(touchMe))
		
	}
	
	@Test
	def void testEstaLejosDeLibreriaEscolar(){
		
		Assert.assertFalse(libreria.ConsultaCercania(touchMe))
		
	}
	
	@Test
	def void testEstaCercaDeKioscoDeDiario(){
	
		Assert.assertFalse(kiosco.ConsultaCercania(touchMe))
			
	}
	
	@Test
	def void testEstaLejosDeKioscoDeDiario(){
	
		Assert.assertTrue(!otroKiosco.ConsultaCercania(touchMe))
			
	}
	
/**************************************************************************/

	
/*********** Distancias a Paradas de Colectivo ***********/	
	@Test
	def void testLaParadaDel28EstaCerca() {
		Assert.assertFalse(colectivoLinea28.ConsultaCercania(touchMe))
	}

	@Test
	def void testLaParadaDel28EstaLejos() {
		Assert.assertTrue(!otroColectivoLinea28.ConsultaCercania(touchMe))
	}
	
	@Test
	def void testLaParadaDel114EstaCerca() {
		Assert.assertFalse(colectivoLinea114.ConsultaCercania(touchMe))
	}

	@Test
	def void testLaParadaDel114EstaLejos() {
		Assert.assertTrue(!otroColectivoLinea114.ConsultaCercania(touchMe))
	}
	
/****************************************************************/

	@Test
	def void testGgpEsValido() {
		Assert.assertTrue(CGP.EsValido())
	}

	@Test
	def void testPoiEsValido() {
		Assert.assertTrue(CGP.ConsultaCercania(touchMe))
	}

}
