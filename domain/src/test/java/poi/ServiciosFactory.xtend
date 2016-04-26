package poi

import org.joda.time.DateTime

class ServiciosFactory {
	
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
	
	def getConsultaHorarioServicioSocial(){
		consultaHorarioServicioSocial
	}
	
	def getConsultaHorarioServicio1(){
		consultaHorarioServicio1
	}
	
	def getConsultaHorarioServicio2(){
		consultaHorarioServicio2
	}
	
	def  getConsultaHorarioServicioBancarioLunes11hs(){
		consultaHorarioServicioBancarioLunes11hs
	}
	
	def  getConsultaHorarioServicioBancarioLunes9hs(){
		consultaHorarioServicioBancarioLunes9hs
	}
	
	def  getConsultaHorarioServicioBancarioLunes18hs(){
		consultaHorarioServicioBancarioLunes18hs
	}
	
	def  getConsultaHorarioServicioBancarioDomingo11hs(){
		consultaHorarioServicioBancarioDomingo11hs
	}
	
	def  getConsultaHorarioServicioComercialMiercoles14hs(){
		consultaHorarioServicioComercialMiercoles14hs
	}
	
	def  getConsultaHorarioServicioComercialMiercoles22hs(){
		consultaHorarioServicioComercialMiercoles22hs
	}
	
	def  getConsultaHorarioServicioColectivosMiercoles13hs(){
		consultaHorarioServicioColectivosMiercoles13hs
	}
	
	def  getConsultaHorarioServicioColectivosDomingo2355hs(){
		consultaHorarioServicioColectivosDomingo2355hs
	}
	
	def  getConsultaHorarioServicioComercialDomingo14hs(){
		consultaHorarioServicioComercialDomingo14hs
	}

	def  getConsultaHorarioServicioComercialMiercoles1245hs(){
		consultaHorarioServicioComercialMiercoles1245hs
	}
	
	def  getConsultaHorarioServicioComercialJeves1835hs(){
		consultaHorarioServicioComercialJeves1835hs
	}
}