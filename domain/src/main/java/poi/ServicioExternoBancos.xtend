package poi

import com.eclipsesource.json.JsonArray
import java.util.List

class ServicioExternoBancos {	
	
	JsonArray listaBancos = new JsonArray()
	
	def List<Poi> BuscarPorTexto(String texto)
	{
		// Aca se debe invocar al servicio externo
		// EJemplo:
		// JsonArray listaBancos = ServicioExterno......
		
		this.Map(listaBancos)
	}
	
	def List<Poi> Map(JsonArray jsonBancos)
	{
		// Aca se mapea el JsonArray que viene del servicio externo a nuestro dominio...
	}
	
	
	
}