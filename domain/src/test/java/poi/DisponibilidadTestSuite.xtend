package poi

import org.joda.time.DateTime
import org.junit.Assert
import org.junit.Before
import org.junit.Test
import org.uqbar.geodds.Point

class DisponibilidadTestSuite {

	Point p1
	Point p2
	Point p3
	Point p4
	Point p5
	Point p6
	Point p7
	Point p8
	Point p9
	CGP cgp1
	
	HorarioDeAtencion lunesMañana
	Servicio servicioSocial
	Servicio servicioBancario
	Servicio servicioDeColectivos
	Banco	santanderRio
	Banco galicia
	LibreriaEscolar libreria
	KioscoDiarios kioscoDeLaEsquina
	ParadaColectivo parada114
	
	ServicioYHorario consultaHorarioServicioSocial = new ServicioYHorario("Servicio Social", new DateTime(2016,4,11,10,30)) 	
	ServicioYHorario consultaHorarioServicio1 = new ServicioYHorario("Servicio 1", new DateTime(2016,4,12,10,30))
	ServicioYHorario consultaHorarioServicio2 = new ServicioYHorario("Servicio 2", new DateTime(2016,4,11,10,30))
	
	ServicioYHorario consultaHorarioServicioBancarioLunes11hs = new ServicioYHorario ("Bancario",new DateTime(2016,4,11,11,00)) //Lunes a las 11hs
	ServicioYHorario consultaHorarioServicioBancarioLunes9hs = new ServicioYHorario ("Bancario",new DateTime(2016,4,11,9,00))
	ServicioYHorario consultaHorarioServicioBancarioLunes18hs = new ServicioYHorario ("Bancario",new DateTime(2016,4,11,18,00))
	ServicioYHorario consultaHorarioServicioBancarioDomingo11hs = new ServicioYHorario ("Bancario",new DateTime(2016,4,17,11,00))
	ServicioYHorario consultaHorarioServicioColectivosMiercoles13hs = new ServicioYHorario ("Colectivo",new DateTime(2016,4,13,13,00))
	ServicioYHorario consultaHorarioServicioColectivosDomingo2355hs = new ServicioYHorario ("Colectivo",new DateTime(2016,4,17,23,55))
	
	ServicioYHorario consultaHorarioServicioComercialMiercoles14hs = new ServicioYHorario ("Comercial",new DateTime(2016,4,13,14,00))	
	ServicioYHorario consultaHorarioServicioComercialMiercoles22hs = new ServicioYHorario ("Comercial",new DateTime(2016,4,13,22,00))
	ServicioYHorario consultaHorarioServicioComercialDomingo14hs = new ServicioYHorario ("Comercial",new DateTime(2016,4,17,14,00))
	ServicioYHorario consultaHorarioServicioComercialMiercoles1245hs = new ServicioYHorario ("Comercial",new DateTime(2016,4,13,12,35))
	ServicioYHorario consultaHorarioServicioComercialJeves1835hs = new ServicioYHorario ("Comercial", new DateTime(2016,4,14,18,35))
	
	@Before
	def void init() {
		p1 = new Point(1, 1)
		p2 = new Point(2, 2)
		p3 = new Point(3, 3)
		p4 = new Point(1, 5)
		p5 = new Point(6, 7)
		p6 = new Point(1, 4)
		p7 = new Point(2, 1)
		p8 = new Point(2, 3)
		p9 = new Point(2, 1)
		
		cgp1 = new CGP(new Point(0, 0), "CGP 1", new Comuna("Comuna 1", p1, p2, p3))

		lunesMañana = new HorarioDeAtencion(1, 10, 13)
		
		servicioSocial = new Servicio("Servicio Social",1, 9, 18)
		
		servicioDeColectivos = new Servicio("Colectivos", 1, 0, 24)
		servicioDeColectivos.AgregarHorario(2, 0, 24)
		servicioDeColectivos.AgregarHorario(3, 0, 24)
		servicioDeColectivos.AgregarHorario(4, 0, 24)
		servicioDeColectivos.AgregarHorario(5, 0, 24)
		servicioDeColectivos.AgregarHorario(6, 0, 24)
		servicioDeColectivos.AgregarHorario(7, 0, 24)
		
		servicioBancario = new Servicio("Bancario", 1, 10, 15)
		servicioBancario.AgregarHorario(2,10, 15)
		servicioBancario.AgregarHorario(3,10, 15)
		servicioBancario.AgregarHorario(4,10, 15)
		servicioBancario.AgregarHorario(5,10, 15)
		
		cgp1.AgregaServicio(servicioSocial)
		
		santanderRio = new Banco(p4,"Santander Rio")
		santanderRio.AgregaServicio(servicioBancario)
		galicia = new Banco(p5, "Banco Galicia")
		galicia.AgregaServicio(servicioBancario)
		
		libreria = new LibreriaEscolar(p6,"LibreriaEscolar",lunesMañana,"Comercial")
		libreria.AgregarHorarios(2,6,10,13) //De Martes a Sábado de 10hs a 13hs
		libreria.AgregarHorarios(1,6,17,20) //De Lunes a Sábado de 15hs a 20hs
		kioscoDeLaEsquina = new KioscoDiarios(p7, "Kiosco de la esquina", lunesMañana,"Comercial") 
		kioscoDeLaEsquina.AgregarHorarios(2,7,10,13) //De Martes a Domingo de 10hs a 13hs
		kioscoDeLaEsquina.AgregarHorarios(1,7,17,20)//De Lunes a Domingo de 15hs a 20hs
		parada114 = new ParadaColectivo(p8, "Parada Colectivo 114")
	}

	@Test
	def void testDisponibilidadServicioCGP() {
		Assert.assertTrue(this.cgp1.ConsultaDisponibilidad(consultaHorarioServicioSocial))
		Assert.assertFalse(this.cgp1.ConsultaDisponibilidad(consultaHorarioServicio1))
		Assert.assertFalse(this.cgp1.ConsultaDisponibilidad(consultaHorarioServicio2))
	}
	
	@Test
	def void testDisponibilidadBanco(){
		//Disponibilidad del banco el lunes a las 11hs.
		Assert.assertTrue(this.santanderRio.ConsultaDisponibilidad(consultaHorarioServicioBancarioLunes11hs))
		//Disponibilidad del banco el lunes a las 9hs.
		Assert.assertFalse(this.santanderRio.ConsultaDisponibilidad(consultaHorarioServicioBancarioLunes9hs))
		//Disponibilidad del banco el lunes a las 18hs.
		Assert.assertFalse(this.santanderRio.ConsultaDisponibilidad(consultaHorarioServicioBancarioLunes18hs))
		//Disponibilidad del banco el domingo a las 11hs 
		Assert.assertFalse(this.santanderRio.ConsultaDisponibilidad(consultaHorarioServicioBancarioDomingo11hs))
	}
	
	@Test
	def void testDisponibilidadParadaDeColectivo(){
		//Disponibilidad el miercoles a las 13hs
		Assert.assertTrue(this.parada114.ConsultaDisponibilidad(consultaHorarioServicioColectivosMiercoles13hs))
		//Disponibilidad el domingo a las 23:55hs
		Assert.assertTrue(this.parada114.ConsultaDisponibilidad(consultaHorarioServicioColectivosDomingo2355hs))
	}
	@Test
	def void testDisponibilidadLocalesComerciales(){
		//Disponibilidad el miercoles a las 14hs
		Assert.assertFalse(this.libreria.ConsultaDisponibilidad(consultaHorarioServicioComercialMiercoles14hs))
		//Disponibilidad el miercoles a las 22hs
		Assert.assertFalse(this.libreria.ConsultaDisponibilidad(consultaHorarioServicioComercialMiercoles22hs))
		//Disponibilidad el domingo a las 14hs
		Assert.assertFalse(this.libreria.ConsultaDisponibilidad(consultaHorarioServicioComercialDomingo14hs))
		//Disponibilidad el miercoles a las 12:35hs
		Assert.assertTrue(this.libreria.ConsultaDisponibilidad(consultaHorarioServicioComercialMiercoles1245hs))
		//Disponibilidad el jueves a las 18:35hs
		Assert.assertTrue(this.libreria.ConsultaDisponibilidad(consultaHorarioServicioComercialJeves1835hs))
		//Disponibilidad el domingo a las 14hs
		Assert.assertFalse(this.kioscoDeLaEsquina.ConsultaDisponibilidad(consultaHorarioServicioComercialDomingo14hs))
		//Disponibilidad el miercoles a las 12:45hs
		Assert.assertTrue(this.kioscoDeLaEsquina.ConsultaDisponibilidad(consultaHorarioServicioComercialMiercoles1245hs))
	}
	
	
}
