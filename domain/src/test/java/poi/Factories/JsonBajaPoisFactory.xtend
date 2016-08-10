package poi.Factories

import com.eclipsesource.json.Json
import com.eclipsesource.json.JsonArray
import com.eclipsesource.json.JsonObject
import org.eclipse.xtend.lib.annotations.Accessors

@Accessors
class JsonBajaPoisFactory {

	public JsonObject jsonBajaPoi1
	public JsonObject jsonBajaPoi2
	public JsonObject jsonBajaPoiInexistente
	public JsonArray jsonBajaPoiArray
	private JsonObject aux

	new() {
		jsonBajaPoi1 = this.CreateBajaPoi1()
		jsonBajaPoi2 = this.CreateBajaPoi2()
		jsonBajaPoiInexistente = this.CreateBajaPoi3()
		jsonBajaPoiArray = new JsonArray().add(jsonBajaPoi1)
						.add(jsonBajaPoi2).add(jsonBajaPoiInexistente)
	}

	def CreateBajaPoi1() {
		aux = Json.object()
		.add("valorDeBusqueda", "poi 1")
		.add("fechaDeBaja", "15/06/2016")	

		return aux
	}

	def CreateBajaPoi2() {
		aux = Json.object()
		.add("valorDeBusqueda", "poi 2")
		.add("fechaDeBaja", "15/06/2016")	

		return aux
	}
	
	def CreateBajaPoi3() {
		aux = Json.object()
		.add("valorDeBusqueda", "poi inexistente")
		.add("fechaDeBaja", "15/06/2016")	

		return aux
	}

}
