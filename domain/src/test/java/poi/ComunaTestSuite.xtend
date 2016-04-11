package poi

import org.uqbar.geodds.Point
import org.junit.Before
import org.junit.Test
import org.junit.Assert

class ComunaTestSuite {

	var Point puntoInside
	Point puntoOut
	Point puntoCgp13
	Point puntoTouchMe
	var Point puntoVertice1
	var Point puntoVertice2
	var Point puntoVertice3

	var Comuna comuna13

	

	@Before
	def void init() {
		
		puntoVertice1 = new Point(-34.534645, -58.465027)  //Av. Lugones y Gral.Paz
		puntoVertice2 = new Point(-34.566598, -58.471550) //Blanco Encalada 3500
		puntoVertice3 = new Point(-34.561650, -58.442024)  //Av.Del Libertador 1600

		puntoInside = new Point(-34.557267, -58.452839) //11 de Septiembre 2200
		puntoOut = new Point(-34.577623, -58.484424) //Mendoza 5100 (Villa Urquiza)
		
		puntoCgp13 = new Point(-34.553898,-58.464051) // Av. Cabildo 3000
		puntoTouchMe = new Point(-34.558681,-58.452667) //3 de Febrero 2100

		comuna13 = new Comuna("Comuna13 Test", puntoVertice1, puntoVertice2, puntoVertice3)
	}

	@Test
	def void testEstaDentroDeComuna() {
		Assert.assertTrue(comuna13.PertenecePoint(puntoInside))
	}
	
	@Test
	def void testEstaFueraDecomuna() {
		Assert.assertFalse((comuna13.PertenecePoint(puntoOut)))
	}
	
	@Test
	def void testEstaCercaDeCgp13() {
		Assert.assertTrue(comuna13.AmbosPuntosPertenecen(puntoTouchMe,puntoCgp13))
	}

}
