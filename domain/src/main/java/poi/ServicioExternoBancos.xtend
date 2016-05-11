package poi

import com.eclipsesource.json.JsonArray
import java.util.List

class ServicioExternoBancos {	
	
	JsonArray listaBancos = new JsonArray()
	AdapterBanco adapter

	def List<Banco> BuscarPorTexto(String texto)
	{
		// Aca se debe invocar al servicio externo
		// EJemplo:
		// JsonArray listaBancos = ServicioExterno......
		
		this.Map(listaBancos)
	}	

	def List<Banco> Map(JsonArray jsonBancos)
	{
		// Aca se mapea el JsonArray que viene del servicio externo a nuestro dominio...
		adapter = new AdapterBanco()
		adapter.adaptarBanco(jsonBancos)
	}
}