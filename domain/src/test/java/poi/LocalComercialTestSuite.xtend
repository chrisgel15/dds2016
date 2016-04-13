package poi

import org.junit.Assert
import org.junit.Before
import org.junit.Test
import org.uqbar.geodds.Point

class LocalComercialTestSuite {
	
	TouchMe touchMe
	LibreriaEscolar libreria
	LibreriaEscolar otraLibreria
	KioscoDiarios kiosco
	KioscoDiarios otroKiosco
	HorarioDeAtencion horarioLibreria
	HorarioDeAtencion horarioKiosco
	
	
	
	@Before
	def void init(){
		
		touchMe = new TouchMe(new Point(-34.562088, -58.456646), "Ubicacion Touch.Me") // Av. Cabildo 2000
		kiosco = new KioscoDiarios(new Point(-34.623182,-58.447528), "Lo de Pepe",horarioKiosco=new HorarioDeAtencion(1,6,15),"Diarios") // Av. Rivadavia 5800
		otroKiosco = new KioscoDiarios(new Point(-34.561045,-58.457585), "Cachos",horarioKiosco=new HorarioDeAtencion(1,6,17),"Revistas") //Av. Cabildo 2200
		libreria = new LibreriaEscolar(new Point(-34.595895,-58.394422), "LosPibes",horarioLibreria=new HorarioDeAtencion(7,9,18),"Cuadernos") //Av.Santa Fe 1800
		otraLibreria = new LibreriaEscolar(new Point(-34.564678,-58.454460),"Lilita",horarioLibreria=new HorarioDeAtencion(5,9,18),"Lapiceras") //Av. Cabildo 1800

		
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