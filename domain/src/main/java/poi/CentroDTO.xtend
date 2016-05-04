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
	
}