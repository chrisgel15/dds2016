package poi

import org.uqbar.xtrest.api.annotation.Controller
import org.uqbar.xtrest.json.JSONUtils
import org.uqbar.xtrest.api.annotation.Get
import org.uqbar.xtrest.api.Result
import org.uqbar.xtrest.http.ContentType
import poi.RepositorioUsuarios
import org.uqbar.xtrest.api.XTRest

@Controller
class UsuariosController {
	
	extension JSONUtils = new JSONUtils
	
	@Get("/login")
	def Result usuarios() {	
		val usuarios = RepositorioUsuarios.instance.allInstances()
		response.contentType = ContentType.APPLICATION_JSON
		ok(usuarios.toJson)
	}
	
	def static void main(String[] args) {	
		XTRest.start(UsuariosController, 9000)
	}
	
	
	
}