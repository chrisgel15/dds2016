package poi

import com.eclipsesource.json.JsonArray
import com.eclipsesource.json.JsonValue
import java.util.ArrayList
import java.util.List
import org.uqbar.geodds.Point

class ServicioExternoBancos {	
	
	JsonArray listaBancos = new JsonArray()
	List<Banco> bancos
	
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
		bancos = new ArrayList<Banco>()
		var double coordenadaY
		var double coordenadaX
		var String nombre
		var JsonArray servicios	
		for (JsonValue value : jsonBancos) {
			nombre = value.asObject().get("banco").asString()			
			coordenadaY = value.asObject().get("y").asDouble()
			coordenadaX = value.asObject().get("x").asDouble()
			servicios = value.asObject().get("servicios").asArray()
			bancos.add(crearPoi(nombre, coordenadaX, coordenadaY, servicios))
		}
	return bancos
	}

	def Banco crearPoi(String nomBanco, double x, double y, JsonArray servicios) {
		//Se crean los bancos con los datos que se mapearon de Json
		var Banco banco = new Banco(new Point(x,y), nomBanco)
		var String nombreServicio
		for (JsonValue servicio : servicios){
			nombreServicio=servicio.asString()
			banco.AgregaServicio(new Servicio(nombreServicio,1,10,15))
		}
		return banco
	}

}