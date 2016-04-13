package poi

import org.junit.Before
import org.uqbar.geodds.Point
import org.junit.Test
import org.junit.Assert

class CgpTestSuite {
		
		var TouchMe touchMe
		var Poi cgp13
		var Comuna comuna13
		var Point puntoVertice1
		var Point puntoVertice2
		var Point puntoVertice3
		
		@Before
		def void init(){
			
			puntoVertice1 = new Point(-34.534645, -58.465027)  //Av. Lugones y Gral.Paz
			puntoVertice2 = new Point(-34.566598, -58.471550) //Blanco Encalada 3500
			puntoVertice3 = new Point(-34.561650, -58.442024)  //Av.Del Libertador 1600
			comuna13 = new Comuna("Comuna13 Test", puntoVertice1, puntoVertice2, puntoVertice3)
			
			touchMe = new TouchMe(new Point(-34.598748, -58.375412), "Touch.Me en Av.Cordoba y Florida")
			cgp13 = new CGP(new Point(-34.553898,-58.464051), "Ubicacion Cgp",comuna13)
		}
		
		 @Test
		def void testEstaCercaDeCgp(){
			Assert.assertFalse(cgp13.ConsultaCercania(touchMe))
		}
		
		@Test
		def void testEstaLejosDeCgp(){
			Assert.assertTrue(!cgp13.ConsultaCercania(touchMe))
		}
		
		@Test
		def void testGgpEsValido(){
			Assert.assertTrue(cgp13.EsValido())
		}
}
