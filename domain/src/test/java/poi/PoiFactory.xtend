package poi

import org.uqbar.geodds.Point
import org.eclipse.xtend.lib.annotations.Accessors

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
	
	HorarioDeAtencion lunesMañana
	Servicio servicioSocial
	Servicio servicioBancario
	Servicio servicioDeColectivos
	Banco	santanderRio
	Banco galicia
	LocalComercial libreria
	IRubro rubroLibreria
	LocalComercial kioscoDeLaEsquina
	IRubro rubroKiosco
	ParadaColectivo parada114
	CGP cgp
	

	PointFactory pointFactory

	new (){
		pointFactory = new PointFactory()
		pointFactory.cargaDeCoordenada()
		
		cgp = new CGP(new Point(0, 0), "CGP 1", new Comuna("Comuna 1", pointFactory.puntoVertice1, pointFactory.puntoVertice2, pointFactory.puntoVertice3))

		lunesMañana = new HorarioDeAtencion(lunes, 10, 13)
		
		servicioSocial = new Servicio("Servicio Social",lunes, 9, 18)
		
		servicioDeColectivos = new Servicio("Colectivos", lunes, 0, 24)
		servicioDeColectivos.AgregarHorario(martes, 0, 24)
		servicioDeColectivos.AgregarHorario(miercoles, 0, 24)
		servicioDeColectivos.AgregarHorario(jueves, 0, 24)
		servicioDeColectivos.AgregarHorario(viernes, 0, 24)
		servicioDeColectivos.AgregarHorario(sabado, 0, 24)
		servicioDeColectivos.AgregarHorario(domingo, 0, 24)
		
		servicioBancario = new Servicio("Bancario", lunes, 10, 15)
		servicioBancario.AgregarHorario(martes,10, 15)
		servicioBancario.AgregarHorario(miercoles,10, 15)
		servicioBancario.AgregarHorario(jueves,10, 15)
		servicioBancario.AgregarHorario(sabado,10, 15)
		
		cgp.AgregaServicio(servicioSocial)
		
		santanderRio = new Banco(pointFactory.puntoBancoSantander,"Santander Rio")
		santanderRio.AgregaServicio(servicioBancario)
		galicia = new Banco(pointFactory.puntoBancoGalicia, "Banco Galicia")
		galicia.AgregaServicio(servicioBancario)
		
		rubroLibreria = new LibreriaEscolar("Libreria")
		libreria = new LocalComercial(pointFactory.puntoLibreria,"LibreriaEscolar",lunesMañana,rubroLibreria)
		libreria.AgregarHorarios(martes,sabado,10,13) //De Martes a Sábado de 10hs a 13hs
		libreria.AgregarHorarios(lunes,sabado,17,20) //De Lunes a Sábado de 15hs a 20hs
		
		rubroKiosco = new KioscoDiarios("Kiosco")
		kioscoDeLaEsquina = new LocalComercial(pointFactory.puntoKiosco, "Kiosco de la esquina", lunesMañana,rubroKiosco) 
		kioscoDeLaEsquina.AgregarHorarios(martes,domingo,10,13) //De Martes a Domingo de 10hs a 13hs
		kioscoDeLaEsquina.AgregarHorarios(lunes,domingo,17,20)//De Lunes a Domingo de 15hs a 20hs
		parada114 = new ParadaColectivo(pointFactory.puntoParada114, "Parada Colectivo 114")
	}
	
}