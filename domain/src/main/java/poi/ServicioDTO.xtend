package poi

import org.eclipse.xtend.lib.annotations.Accessors
import java.util.List

@Accessors
class ServicioDTO {

	List<RangoServicioDTO> rangos

	String nombreServicio

	new(String nom, List<RangoServicioDTO> rangos) {
		this.nombreServicio = nom
		this.rangos = rangos
	}
}
