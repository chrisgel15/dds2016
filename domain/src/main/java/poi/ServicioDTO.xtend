package poi

import org.eclipse.xtend.lib.annotations.Accessors
import java.util.List

@Accessors

class ServicioDTO {
		
		List<RangoServicioDTO> rangos
		
		String nombreServicio
}