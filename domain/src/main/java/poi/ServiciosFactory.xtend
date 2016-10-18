//package poi.Factories
package poi

import org.joda.time.DateTime
import org.eclipse.xtend.lib.annotations.Accessors
import poi.Servicio

@Accessors
class ServiciosFactory {
	
	poi.ServicioYHorario consultaHorarioServicioSocial = new poi.ServicioYHorario("Servicio Social", new DateTime(2016,4,11,10,30)) 	
	poi.ServicioYHorario consultaHorarioServicio1 = new poi.ServicioYHorario("Servicio 1", new DateTime(2016,4,12,10,30))
	poi.ServicioYHorario consultaHorarioServicio2 = new poi.ServicioYHorario("Servicio 2", new DateTime(2016,4,11,10,30))
	
	poi.ServicioYHorario consultaHorarioServicioBancarioLunes11hs = new poi.ServicioYHorario ("Bancario",new DateTime(2016,4,11,11,00)) //Lunes a las 11hs
	poi.ServicioYHorario consultaHorarioServicioBancarioLunes9hs = new poi.ServicioYHorario ("Bancario",new DateTime(2016,4,11,9,00))
	poi.ServicioYHorario consultaHorarioServicioBancarioLunes18hs = new poi.ServicioYHorario ("Bancario",new DateTime(2016,4,11,18,00))
	poi.ServicioYHorario consultaHorarioServicioBancarioDomingo11hs = new poi.ServicioYHorario ("Bancario",new DateTime(2016,4,17,11,00))
	
	poi.ServicioYHorario consultaHorarioServicioColectivosMiercoles13hs = new poi.ServicioYHorario ("Colectivo",new DateTime(2016,4,13,13,00))
	poi.ServicioYHorario consultaHorarioServicioColectivosDomingo2355hs = new poi.ServicioYHorario ("Colectivo",new DateTime(2016,4,17,23,55))
	
	poi.ServicioYHorario consultaHorarioServicioComercialMiercoles14hs = new poi.ServicioYHorario ("Comercial",new DateTime(2016,4,13,14,00))	
	poi.ServicioYHorario consultaHorarioServicioComercialMiercoles22hs = new poi.ServicioYHorario ("Comercial",new DateTime(2016,4,13,22,00))
	poi.ServicioYHorario consultaHorarioServicioComercialDomingo14hs = new poi.ServicioYHorario ("Comercial",new DateTime(2016,4,17,14,00))
	poi.ServicioYHorario consultaHorarioServicioComercialMiercoles1245hs = new poi.ServicioYHorario ("Comercial",new DateTime(2016,4,13,12,35))
	poi.ServicioYHorario consultaHorarioServicioComercialJeves1835hs = new poi.ServicioYHorario ("Comercial", new DateTime(2016,4,14,18,35))
	
	Servicio servicioBanco1 = new Servicio("Servicio bancario 1", 1, 10, 15)
	Servicio servicioBanco2 = new Servicio("Cajero", 2, 10, 15)
	Servicio servicioBanco3 = new Servicio("Extracciones", 3, 10, 15)
	Servicio servicioBanco4 = new Servicio("Creditos", 4, 10, 15)
	Servicio servicioBanco5 = new Servicio("Tarjetas", 5, 10, 15)
	
	Servicio servicioCGP1 = new Servicio("Servicio CGP 1", 1, 8, 20)
	Servicio servicioCGP2 = new Servicio("Servicio CGP 2", 2, 9, 18)
	Servicio servicioCGP3 = new Servicio("Servicio CGP 3", 3, 10, 13)
	Servicio servicioCGP4 = new Servicio("Servicio CGP 4", 4, 13, 17)
	Servicio servicioCGP5 = new Servicio("Servicio CGP 5", 5, 6, 13)
	
	
//	def getConsultaHorarioServicioSocial(){
//		consultaHorarioServicioSocial
//	}
//	
//	def getConsultaHorarioServicio1(){
//		consultaHorarioServicio1
//	}
//	
//	def getConsultaHorarioServicio2(){
//		consultaHorarioServicio2
//	}
//	
//	def  getConsultaHorarioServicioBancarioLunes11hs(){
//		consultaHorarioServicioBancarioLunes11hs
//	}
//	
//	def  getConsultaHorarioServicioBancarioLunes9hs(){
//		consultaHorarioServicioBancarioLunes9hs
//	}
//	
//	def  getConsultaHorarioServicioBancarioLunes18hs(){
//		consultaHorarioServicioBancarioLunes18hs
//	}
//	
//	def  getConsultaHorarioServicioBancarioDomingo11hs(){
//		consultaHorarioServicioBancarioDomingo11hs
//	}
//	
//	def  getConsultaHorarioServicioComercialMiercoles14hs(){
//		consultaHorarioServicioComercialMiercoles14hs
//	}
//	
//	def  getConsultaHorarioServicioComercialMiercoles22hs(){
//		consultaHorarioServicioComercialMiercoles22hs
//	}
//	
//	def  getConsultaHorarioServicioColectivosMiercoles13hs(){
//		consultaHorarioServicioColectivosMiercoles13hs
//	}
//	
//	def  getConsultaHorarioServicioColectivosDomingo2355hs(){
//		consultaHorarioServicioColectivosDomingo2355hs
//	}
//	
//	def  getConsultaHorarioServicioComercialDomingo14hs(){
//		consultaHorarioServicioComercialDomingo14hs
//	}
//
//	def  getConsultaHorarioServicioComercialMiercoles1245hs(){
//		consultaHorarioServicioComercialMiercoles1245hs
//	}
//	
//	def  getConsultaHorarioServicioComercialJeves1835hs(){
//		consultaHorarioServicioComercialJeves1835hs
//	}
}
														