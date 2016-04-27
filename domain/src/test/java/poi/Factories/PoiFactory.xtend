package poi.Factories

import org.uqbar.geodds.Point
import org.eclipse.xtend.lib.annotations.Accessors
import poi.LocalComercial

@Accessors
class PoiFactory {
	//Días de la semana
	int lunes = 1
	int martes = 2
	int miercoles = 3
	int jueves = 4
	int viernes = 5 
	int sabado = 6
	int domingo = 7
	
	poi.HorarioDeAtencion lunesMañana
	poi.Servicio servicioSocial
	poi.Servicio servicioBancario
	poi.Servicio servicioDeColectivos
	poi.Banco	santanderRio
	poi.Banco galicia
	poi.Banco banco_nacion
	poi.LocalComercial libreria
	poi.LocalComercial libreriaEscolar
	poi.IRubro rubroLibreria
	poi.LocalComercial kioscoDeLaEsquina
	poi.IRubro rubroKiosco
	poi.ParadaColectivo parada114
	poi.CGP cgp
	poi.CGP cgpAlmagro
	

	PointFactory pointFactory
	
	ComunaFactory comunaFactory

	new (){
		pointFactory = new PointFactory()
		comunaFactory = new ComunaFactory()		
		
		cgp = new poi.CGP(new Point(0, 0), "CGP 1", new poi.Comuna("Comuna 1", pointFactory.puntoVertice1, pointFactory.puntoVertice2, pointFactory.puntoVertice3))
		cgpAlmagro = new poi.CGP(pointFactory.puntoCero, "Almagro", comunaFactory.comunaAlmagro)
		cgpAlmagro.etiqueta = "Gestion"

		lunesMañana = new poi.HorarioDeAtencion(lunes, 10, 13)
		
		servicioSocial = new poi.Servicio("Servicio Social",lunes, 9, 18)
		
		servicioDeColectivos = new poi.Servicio("Colectivos", lunes, 0, 24)
		servicioDeColectivos.AgregarHorario(martes, 0, 24)
		servicioDeColectivos.AgregarHorario(miercoles, 0, 24)
		servicioDeColectivos.AgregarHorario(jueves, 0, 24)
		servicioDeColectivos.AgregarHorario(viernes, 0, 24)
		servicioDeColectivos.AgregarHorario(sabado, 0, 24)
		servicioDeColectivos.AgregarHorario(domingo, 0, 24)
		
		servicioBancario = new poi.Servicio("Bancario", lunes, 10, 15)
		servicioBancario.AgregarHorario(martes,10, 15)
		servicioBancario.AgregarHorario(miercoles,10, 15)
		servicioBancario.AgregarHorario(jueves,10, 15)
		servicioBancario.AgregarHorario(sabado,10, 15)
		
		cgp.AgregaServicio(servicioSocial)
		
		santanderRio = new poi.Banco(pointFactory.puntoBancoSantander,"Santander Rio")
		santanderRio.AgregaServicio(servicioBancario)
		galicia = new poi.Banco(pointFactory.puntoBancoGalicia, "Banco Galicia")
		galicia.AgregaServicio(servicioBancario)
		banco_nacion = new poi.Banco(pointFactory.puntoCero, "banco_nacion")
		banco_nacion.AgregaServicio(servicioBancario)
		banco_nacion.etiqueta = "Banco"
		
		rubroLibreria = new poi.LibreriaEscolar("Libreria")
		libreria = new poi.LocalComercial(pointFactory.puntoLibreria,"LibreriaEscolar",lunesMañana,rubroLibreria)
		libreria.AgregarHorarios(martes,sabado,10,13) //De Martes a Sábado de 10hs a 13hs
		libreria.AgregarHorarios(lunes,sabado,17,20) //De Lunes a Sábado de 15hs a 20hs
		
		libreriaEscolar = new LocalComercial(pointFactory.puntoLibreria,"Cuspide",lunesMañana,rubroLibreria)
		libreriaEscolar.AgregarHorarios(martes,sabado,10,13) //De Martes a Sábado de 10hs a 13hs
		libreriaEscolar.AgregarHorarios(lunes,sabado,17,20) //De Lunes a Sábado de 15hs a 20hs
		libreriaEscolar.etiqueta = "Libro"
		
		rubroKiosco = new poi.KioscoDiarios("Kiosco")
		kioscoDeLaEsquina = new poi.LocalComercial(pointFactory.puntoKiosco, "Kiosco de la esquina", lunesMañana,rubroKiosco) 
		kioscoDeLaEsquina.AgregarHorarios(martes,domingo,10,13) //De Martes a Domingo de 10hs a 13hs
		kioscoDeLaEsquina.AgregarHorarios(lunes,domingo,17,20)//De Lunes a Domingo de 15hs a 20hs
		parada114 = new poi.ParadaColectivo(pointFactory.puntoParada114, "Parada Colectivo 114")
		parada114.etiqueta = "Bondi"
	}
	
}
		