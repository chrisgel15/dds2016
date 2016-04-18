package poi

import org.junit.Assert
import org.junit.Before
import org.junit.Test
import org.uqbar.geodds.Point

class LocalComercialTestSuite {
	
	TouchMe touchMe
	LocalComercial libreria
	LocalComercial otraLibreria
	LocalComercial kiosco
	LocalComercial otroKiosco
	HorarioDeAtencion horarioLibreria
	HorarioDeAtencion horarioKiosco
	
	IRubro rubroLibreria
	IRubro rubroKiosco
	
	
	
	@Before
	def void init(){
		
		rubroLibreria = new LibreriaEscolar("Libreria")
		rubroKiosco = new KioscoDiarios("Kiosco")
		touchMe = new TouchMe(new Point(-34.562088, -58.456646), "Ubicacion Touch.Me") // Av. Cabildo 2000
		kiosco = new LocalComercial(new Point(-34.623182,-58.447528), "Lo de Pepe",horarioKiosco=new HorarioDeAtencion(1,6,15),rubroKiosco) // Av. Rivadavia 5800
		otroKiosco = new LocalComercial(new Point(-34.561045,-58.457585), "Cachos",horarioKiosco=new HorarioDeAtencion(1,6,17),rubroKiosco) //Av. Cabildo 2200
		libreria = new LocalComercial(new Point(-34.595895,-58.394422), "LosPibes",horarioLibreria=new HorarioDeAtencion(7,9,18),rubroLibreria) //Av.Santa Fe 1800
		otraLibreria = new LocalComercial(new Point(-34.564678,-58.454460),"Lilita",horarioLibreria=new HorarioDeAtencion(5,9,18),rubroLibreria) //Av. Cabildo 1800

		
	}
	
	@Test
	def void testEstaCercaDeLibreriaEscolar(){
		
		Assert.assertTrue(otraLibreria.ConsultaCercania(touchMe))
		
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
	
		Assert.assertTrue(otroKiosco.ConsultaCercania(touchMe))
			
	}
	
	
}