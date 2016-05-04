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
//		List<Poi> bancos
//		for (JsonValue banco : jsonBancos) {
//			String banco = banco.get("banco").asString();
//			doble coordenadaY = banco.get("y").asDoble();
//			doble coordenadX = banco.get("x").asDoble();
//			ArrayList<String> servicios = banco.get("servicios").asArray();
//			bancos.add(crearPoi(banco, coordenadaX, coordenadaY,servicios))
//		}
		// Aca se mapea el JsonArray que viene del servicio externo a nuestro dominio...
	}
	
//		def Poi crearPoi(String nomBanco, doble x, doble y, ArrayList<String> servicios) {
//		Point
//		punto = new Point(x, y)
//		Banco = new Banco(punto, nomBanco)
//
//		Banco.AgregaListaDeServicios(servicios)
//	}

//	def List<Servicio> (ArrayList<String> serviciosJson)
//	{
//		aux s = new Servicio()
//		
//	}
	
}