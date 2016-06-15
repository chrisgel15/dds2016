package poi

import java.util.List
import com.eclipsesource.json.JsonArray

class ServicioExternoBajaPois {
	
def List<BajaPois> EjecutarServicioGCBA()
	{
		var JsonArray listaBajaPois = new JsonArray()
		// Aca se debe invocar al servicio externo
		// EJemplo:
		// JsonArray listBajaPois... = ServicioExterno......
		
		this.Map(listaBajaPois)
	}	

	def List<BajaPois> Map(JsonArray jsonBajaPois)
	{
		// Aca se mapea el JsonArray que viene del servicio externo a nuestro dominio...
		var AdapterServicioREST adapter
		adapter = new AdapterServicioREST()
		adapter.adaptarRest(jsonBajaPois)
	}
	
}