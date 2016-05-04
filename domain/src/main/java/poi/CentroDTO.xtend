package poi

import org.eclipse.xtend.lib.annotations.Accessors
import java.util.List

@Accessors
class CentroDTO {

	List<ServicioDTO> serviciosDTO

	int numeroComuna
	double coordenadaX
	double coordenadaY
	String zonasIncluidas
	String nombreDirector
	String domicilio
	String telefono

	new(
		int comuna,
		int x,
		int y,
		String zonas,
		String director,
		String dom,
		String telefono,
		List<ServicioDTO> servicios
	) {
		this.numeroComuna = comuna
		this.coordenadaX = x
		this.coordenadaY = y
		this.zonasIncluidas = zonas
		this.nombreDirector = director
		this.domicilio = dom
		this.telefono = telefono
		this.serviciosDTO = servicios
	}

}
