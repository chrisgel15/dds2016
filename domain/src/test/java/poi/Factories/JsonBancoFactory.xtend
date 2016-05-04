package poi.Factories

import com.eclipsesource.json.Json
import com.eclipsesource.json.JsonArray
import com.eclipsesource.json.JsonObject
import org.eclipse.xtend.lib.annotations.Accessors

@Accessors
class JsonBancoFactory {

	public JsonObject jsonBanco1
	public JsonObject jsonBanco2
	public JsonArray jsonBancoArray
	private JsonObject aux

	new() {
		jsonBanco1 = this.CreateBanco1()
		jsonBanco2 = this.CreateBanco2()
		//jsonBancoArray = jsonBanco1.merge(jsonBanco2).asArray()
		jsonBancoArray = new JsonArray().add(jsonBanco1)
						.add(jsonBanco2)
	}

	def CreateBanco1() {
		aux = Json.object().add("banco", "Banco De La Plaza")
		.add("x", -35.933832).add("y", 72.34835)
		.add("sucursal","Avellaneda")
		.add("gerente", "Javier Loeschbor")
		.add("servicios",Json.array("cobro cheques", "depositos", 
						"extracciones", "transferencias", "creditos", "", "", ""))

		return aux
	}

	def CreateBanco2() {
		aux = Json.object().add("banco", "Banco Nacion")
		.add("x", -35.934568)
		.add("y", 72.34454)
		.add("sucursal","Caballito")
		.add("gerente", "Fabian Fantaguzzi")
		.add("servicios",
			Json.array("depositos", "extracciones", "transferencias", "seguros", "", "", "", ""))

		return aux
	}

}
