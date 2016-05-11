package poi

import com.eclipsesource.json.JsonArray
import java.util.List
import com.eclipsesource.json.JsonValue
import org.uqbar.geodds.Point
import java.util.ArrayList
import org.eclipse.xtend.lib.annotations.Accessors

@Accessors
class AdapterBanco {
	
	def List<Banco> adaptarBanco(JsonArray jsonBancos)
	{
		// Se mapea el JsonArray
		var List<Banco> bancos
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