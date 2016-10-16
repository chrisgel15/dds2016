package poi

import com.fasterxml.jackson.core.type.TypeReference
import com.fasterxml.jackson.databind.ObjectMapper
import java.util.ArrayList
import java.util.HashMap
import java.util.List
import java.util.Map
import org.uqbar.xtrest.api.Result
import org.uqbar.xtrest.api.XTRest
import org.uqbar.xtrest.api.annotation.Body
import org.uqbar.xtrest.api.annotation.Controller
import org.uqbar.xtrest.api.annotation.Get
import org.uqbar.xtrest.api.annotation.Post
import org.uqbar.xtrest.http.ContentType
import org.uqbar.xtrest.json.JSONUtils

@Controller
class UsuariosController {
	
	extension JSONUtils = new JSONUtils
	
	@Post("/login")
	def Result login(@Body String body) {	
		val nombre = body.getPropertyValue("nombre") as String
		val pass = body.getPropertyValue("password") as String
		//var existeUsuario = false
		var Usuario user = null
		
		try {
			user = RepositorioUsuarios.instance.search(nombre, pass)
		}
		catch (Exception e)
		{
			// TODO: loguear e.message
			return internalServerError("Ha ocurrido un error. Contacte al administrador.");
		}
		
		if (user == null)
			return badRequest("Usuario o contraseña incorrectos. Intente nuevamente.");
		
		response.contentType = ContentType.APPLICATION_JSON	
		//user.generarFavoritosId()
		ok(user.toJson)
	}
	
	@Post("/home")
	def Result getPois(@Body String body) {
		val criterios = body.fromJson(ArrayList)		
		var List<Poi> pois = new ArrayList<Poi>()
		
				
		try {
			//pois = RepositorioPoi.instance.BuscarPorCriterios(criterios)
			pois = RepositorioPoi.instance.searchByCriterio(criterios)
			
		}
		catch (Exception e)
		{
			// TODO: loguear e.message
			return internalServerError("Ha ocurrido un error. Contacte al administrador.");
		}
		
		if (pois.empty)
			return badRequest("No se encontraron resultados.")
		
		response.contentType = ContentType.APPLICATION_JSON		
		ok(pois.toJson)
	}
	
	@Get("/detalle/:id")
	def Result getPoiById(@Body String body)
	{
		var Poi poi = null
		
		try{
			//poi = RepositorioPoi.instance.searchById(Integer.parseInt(id))
			poi = RepositorioPoi.instance.searchByIdPoi(Integer.parseInt(id))
			
		}
		catch(Exception e)
		{
			// TODO: loguear e.message
			return internalServerError("Ha ocurrido un error. Contacte al administrador.");
		}
		
		response.contentType = ContentType.APPLICATION_JSON		
		ok(poi.toJson)
	}
	
	@Post("/addReview/:id")
	def Result addReview(@Body String body){
		val idPoi = Integer.parseInt(id)
		//val poi = RepositorioPoi.instance.searchById(idPoi)
		val poi = RepositorioPoi.instance.searchByIdPoi(idPoi)
		
		val idUsuario = body.getPropertyValue("idUsuario") as String
		//val usuario = RepositorioUsuarios.instance.searchById(Integer.parseInt(idUsuario))
		val usuario = RepositorioUsuarios.instance.searchByIdUser(Integer.parseInt(idUsuario))
		
		val review = new Review(usuario, 
			Integer.parseInt(body.getPropertyValue("puntaje") as String), body.getPropertyValue("comentario") as String) 
		
		try
		{
			poi.AgregarReview(review)
		}
		catch (Exception ex)
		{
			return badRequest(ex.message)	
		}		
		
		response.contentType = ContentType.APPLICATION_JSON
		ok(poi.reviews.toJson)
	}
	
	@Post("/favorito")
	def Result favorito(@Body String body)
	{
		val idUsuario = body.getPropertyValue("idUsuario") as String
		val idPoi = body.getPropertyValue("idPoi") as String
	//	val agregar = body.getPropertyValue("agregar") as Boolean
		
		//val poi = RepositorioPoi.instance.searchById(Integer.parseInt(idPoi))
		val poi = RepositorioPoi.instance.searchByIdPoi(Integer.parseInt(idPoi))
		//val usuario = RepositorioUsuarios.instance.searchById(Integer.parseInt(idUsuario))
		val usuario = RepositorioUsuarios.instance.searchByIdUser(Integer.parseInt(idUsuario))
			
			try {
				usuario.AgregarFavorito(poi)
			}
			catch(Exception ex)
			{
				return badRequest(ex.message)
			}			
		
		response.contentType = ContentType.APPLICATION_JSON
		ok()
	}
	
	
	
	
	def static void main(String[] args) {	
		XTRest.start(UsuariosController, 9000)
	}
	
	def getPropertyValue(String body, String propiedad) {
	val propiedades = new ObjectMapper().readValue(body,
		new TypeReference<HashMap<String, String>>() {}) (propiedades as Map).get(propiedad)
}
	
	
}

