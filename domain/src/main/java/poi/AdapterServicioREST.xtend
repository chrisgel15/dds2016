package poi

import com.eclipsesource.json.JsonArray
import com.eclipsesource.json.JsonValue
import java.util.ArrayList
import java.util.List

class AdapterServicioREST {
	
	def List<BajaPois> adaptarRest(JsonArray jsonRest)
	{
		// Se mapea el JsonArray
		var List<BajaPois> bajaPois
		bajaPois = new ArrayList<BajaPois>()
		var String valorDeBusqueda
		var String fechaDeBaja	
		for (JsonValue value : jsonRest) {
			valorDeBusqueda = value.asObject().get("valorDeBusqueda").asString()			
			fechaDeBaja = value.asObject().get("fechaDeBaja").asString()
			bajaPois.add(new BajaPois(valorDeBusqueda, fechaDeBaja))
		}
	return bajaPois
	}
}


