package poi

import org.uqbar.xtrest.api.annotation.Controller
import org.uqbar.xtrest.json.JSONUtils
import org.uqbar.xtrest.api.annotation.Get
import org.uqbar.xtrest.api.Result
import org.uqbar.xtrest.http.ContentType
import poi.RepositorioUsuarios
import org.uqbar.xtrest.api.XTRest
import org.uqbar.xtrest.api.annotation.Post
import org.uqbar.xtrest.api.annotation.Body
import com.fasterxml.jackson.databind.ObjectMapper
import com.fasterxml.jackson.core.type.TypeReference
import java.util.HashMap
import java.util.Map

@Controller
class UsuariosController {
	
	extension JSONUtils = new JSONUtils
	
	@Post("/login")
	def Result login(@Body String body) {	
		val nombre = body.getPropertyValue("nombre") as String
		val pass = body.getPropertyValue("password") as String
		var existeUsuario = false
		
		try {
			existeUsuario = RepositorioUsuarios.instance.search(nombre, pass)
		}
		catch (Exception e)
		{
			// TODO: loguear e.message
			return internalServerError("Ha ocurrido un error. Contacte al administrador.");
		}
		
		if (!existeUsuario)
			return badRequest("Usuario o contraseña incorrectos. Intente nuevamente.");
		
		response.contentType = ContentType.APPLICATION_JSON	
		ok(existeUsuario.toJson)
	}
	
	def static void main(String[] args) {	
		XTRest.start(UsuariosController, 9000)
	}
	
	def getPropertyValue(String body, String propiedad) {
	val propiedades = new ObjectMapper().readValue(body,
		new TypeReference<HashMap<String, String>>() {}) (propiedades as Map).get(propiedad)
}
	
	
}

