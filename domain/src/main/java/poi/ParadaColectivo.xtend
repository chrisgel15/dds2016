package poi

import org.uqbar.geodds.Point
import org.eclipse.xtend.lib.annotations.Accessors
import javax.persistence.Entity

@Entity
@Accessors
class ParadaColectivo extends Poi {

	// Referencia una cuadra (0.1 kilometros)
	static double DISTANCIA_PARADA_COLECTIVO = 0.1
	
	new(Point p, String nom) {
		super(p, nom)
		this.tipo = "colectivo"
	}
	
	new(){
		
	}

// El servicio de colectivos siempre esta disponible
	override boolean ConsultaDisponibilidad(ServicioYHorario servicioYHorario) {
		return true
	}

	override ConsultaCercania(PuntoBase destino) {
		this.DistanciaEsMenorA(destino, DISTANCIA_PARADA_COLECTIVO)
	}

	override BusquedaPorTexto(String texto) {
		BusquedaEtiqueta(texto) || BusquedaNombre(texto) || BusquedaDireccion(texto)
	}
	
	

}
