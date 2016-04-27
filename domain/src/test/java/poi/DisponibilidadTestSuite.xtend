package poi

import org.junit.Assert
import org.junit.Before
import org.junit.Test
import poi.Factories.PoiFactory
import poi.Factories.ServiciosFactory

class DisponibilidadTestSuite {
	

	PoiFactory poiFactory
	ServiciosFactory serviciosFactory
	
	@Before
	def void init() {
		
		poiFactory = new PoiFactory()		
		serviciosFactory = new ServiciosFactory()
		
	}

	@Test
	def void testDisponibilidadServicioCGP() {
		Assert.assertTrue(this.poiFactory.cgp.ConsultaDisponibilidad(serviciosFactory.getConsultaHorarioServicioSocial))
		Assert.assertFalse(this.poiFactory.cgp.ConsultaDisponibilidad(serviciosFactory.getConsultaHorarioServicio1))
		Assert.assertFalse(this.poiFactory.cgp.ConsultaDisponibilidad(serviciosFactory.getConsultaHorarioServicio2))
	}
	
	@Test
	def void testDisponibilidadBanco(){
		//Disponibilidad del banco el lunes a las 11hs.
		Assert.assertTrue(this.poiFactory.getSantanderRio.ConsultaDisponibilidad(serviciosFactory.getConsultaHorarioServicioBancarioLunes11hs))
		//Disponibilidad del banco el lunes a las 9hs.
		Assert.assertFalse(this.poiFactory.getSantanderRio.ConsultaDisponibilidad(serviciosFactory.getConsultaHorarioServicioBancarioLunes9hs))
		//Disponibilidad del banco el lunes a las 18hs.
		Assert.assertFalse(this.poiFactory.getSantanderRio.ConsultaDisponibilidad(serviciosFactory.getConsultaHorarioServicioBancarioLunes18hs))
		//Disponibilidad del banco el domingo a las 11hs 
		Assert.assertFalse(this.poiFactory.getSantanderRio.ConsultaDisponibilidad(serviciosFactory.getConsultaHorarioServicioBancarioDomingo11hs))
	}
	
	@Test
	def void testDisponibilidadParadaDeColectivo(){
		//Disponibilidad el miercoles a las 13hs
		Assert.assertTrue(this.poiFactory.getParada114.ConsultaDisponibilidad(serviciosFactory.getConsultaHorarioServicioColectivosMiercoles13hs))
		//Disponibilidad el domingo a las 23:55hs
		Assert.assertTrue(this.poiFactory.getParada114.ConsultaDisponibilidad(serviciosFactory.getConsultaHorarioServicioColectivosDomingo2355hs))
	}
	@Test
	def void testDisponibilidadLocalesComerciales(){
		//Disponibilidad el miercoles a las 14hs
		Assert.assertFalse(this.poiFactory.getLibreria.ConsultaDisponibilidad(serviciosFactory.getConsultaHorarioServicioComercialMiercoles14hs))
		//Disponibilidad el miercoles a las 22hs
		Assert.assertFalse(this.poiFactory.getLibreria.ConsultaDisponibilidad(serviciosFactory.getConsultaHorarioServicioComercialMiercoles22hs))
		//Disponibilidad el domingo a las 14hs
		Assert.assertFalse(this.poiFactory.getLibreria.ConsultaDisponibilidad(serviciosFactory.getConsultaHorarioServicioComercialDomingo14hs))
		//Disponibilidad el miercoles a las 12:35hs
		Assert.assertTrue(this.poiFactory.getLibreria.ConsultaDisponibilidad(serviciosFactory.getConsultaHorarioServicioComercialMiercoles1245hs))
		//Disponibilidad el jueves a las 18:35hs
		Assert.assertTrue(this.poiFactory.getLibreria.ConsultaDisponibilidad(serviciosFactory.getConsultaHorarioServicioComercialJeves1835hs))
		//Disponibilidad el domingo a las 14hs
		Assert.assertFalse(this.poiFactory.kioscoDeLaEsquina.ConsultaDisponibilidad(serviciosFactory.getConsultaHorarioServicioComercialDomingo14hs))
		//Disponibilidad el miercoles a las 12:45hs
		Assert.assertTrue(this.poiFactory.kioscoDeLaEsquina.ConsultaDisponibilidad(serviciosFactory.getConsultaHorarioServicioComercialMiercoles1245hs))
	}
	
	
}
