package poi

import com.eclipsesource.json.JsonArray
import java.util.List

class ServicioExternoBancos {	
		
	def List<Banco> BuscarPorTexto(String texto)
	{
		var JsonArray listaBancos = new JsonArray()
		// Aca se debe invocar al servicio externo
		// EJemplo:
		// JsonArray listaBancos = ServicioExterno......
		
		this.Map(listaBancos)
	}	

	def List<Banco> Map(JsonArray jsonBancos)
	{
		// Aca se mapea el JsonArray que viene del servicio externo a nuestro dominio...
		var AdapterBanco adapter
		adapter = new AdapterBanco()
		adapter.adaptarBanco(jsonBancos)
	}
}