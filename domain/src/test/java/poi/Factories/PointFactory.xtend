package poi.Factories

import org.uqbar.geodds.Point
import org.eclipse.xtend.lib.annotations.Accessors

@Accessors
class PointFactory {
	
	Point puntoVertice1
	Point puntoVertice2
	Point puntoVertice3
	Point puntoInside
	Point puntoOut
	Point puntoCgp13
	Point puntoCgp
	Point puntoTouchMe
	Point puntoKiosco
	Point puntoOtroKiosco
	Point puntoLibreria
	Point puntoOtraLibreria
	Point puntoParada28
	Point puntoOtraParada28
	Point puntoParada114
	Point puntoOtraParada114
	Point puntoBancoSantander
	Point puntoBancoGalicia	
	
	new(){
		puntoVertice1 = new Point(-34.534645, -58.465027) // Av. Lugones y Gral.Paz
		puntoVertice2 = new Point(-34.566598, -58.471550) // Blanco Encalada 3500
		puntoVertice3 = new Point(-34.561650, -58.442024) // Av.Del Libertador 1600
		puntoInside = new Point(-34.557267, -58.452839) //11 de Septiembre 2200
		puntoOut = new Point(-34.577623, -58.484424) //Mendoza 5100 (Villa Urquiza)
		puntoCgp13 = new Point(-34.553898,-58.464051) // Av. Cabildo 3000
		puntoCgp = new Point(-34.553935, -58.463992)
		puntoTouchMe = new Point(-34.558681,-58.452667) //3 de Febrero 2100
		puntoKiosco = new Point(-34.623182,-58.447528)
		puntoOtroKiosco = new Point(-34.561045,-58.457585)
		puntoLibreria = new Point(-34.595895,-58.394422)
		puntoOtraLibreria = new Point(-34.564678,-58.454460)
		puntoParada28 = new Point(-34.550513, -58.499996)
		puntoOtraParada28 = new Point(-34.634487, -58.529944)
		puntoParada114 = new Point(-34.581020, -58.493649)
		puntoOtraParada114 = new Point(-34.558240, -58.459838)
		puntoBancoSantander = new Point (-34.558300, -58.459800)
		puntoBancoGalicia = new Point (-34.558320, -58.459811)
	}
}
