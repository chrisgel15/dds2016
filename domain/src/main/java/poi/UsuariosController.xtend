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
import com.fasterxml.jackson.databind.ser.FilterProvider
import com.fasterxml.jackson.databind.ser.impl.SimpleFilterProvider
import com.fasterxml.jackson.databind.ser.impl.SimpleBeanPropertyFilter

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
			user = RepositorioUsuarios.instance.searchByNamePass(nombre, pass)
		}
		catch (Exception e)
		{
			// TODO: loguear e.message
			return internalServerError("Ha ocurrido un error. Contacte al administrador.");
		}
		
		if (user == null)
			return badRequest("Usuario o contraseña incorrectos. Intente nuevamente.");
		
		response.contentType = ContentType.APPLICATION_JSON	
		ok(user.toJson)
	}
	
	@Post("/home")
	def Result getPois(@Body String body) {
		val criterios = body.fromJson(ArrayList)		
		var List<Poi> pois = new ArrayList<Poi>()	
				
		try {			
			pois = RepositorioPoi.instance.searchByCriterio(criterios)			
		}
		catch (Exception e)
		{			// TODO: loguear e.message
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
			poi = RepositorioPoi.instance.searchById(Long.parseLong(id))		
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
		val idPoi = Long.parseLong(id)
		val poi = RepositorioPoi.instance.searchById(idPoi)		
		
		val idUsuario = body.getPropertyValue("idUsuario") as String
		val usuario = RepositorioUsuarios.instance.searchById(Long.parseLong(idUsuario))		
		
		val review = new Review(usuario, 
			Integer.parseInt(body.getPropertyValue("puntaje") as String), body.getPropertyValue("comentario") as String)
			
		// TODO: Que tire la excepcion cuando no lo puede agregar...
		try
		{
				val p = RepositorioPoi.instance.searchById(idPoi)
				if (!p.reviews.exists[ r | r.usuario.id.toString == idUsuario ])
				{
					poi.AgregarReview(review)
					RepositorioPoi.instance.update(poi)
				}
				
		}
		catch (YaExisteReviewException ex)
		{
			return badRequest(ex.message)
		}
		catch (Exception ex)
		{
			// loguear la exception
			return badRequest("Ocurrio un error, contacte al administrador.")	
		}	
		
		response.contentType = ContentType.APPLICATION_JSON
		ok(RepositorioPoi.instance.searchById(idPoi).reviews.toJson)
	}
	
	@Post("/favorito")
	def Result favorito(@Body String body)
	{
		val idUsuario = body.getPropertyValue("idUsuario") as String
		val idPoi = body.getPropertyValue("idPoi") as String
	//	val agregar = body.getPropertyValue("agregar") as Boolean
		
		val poi = RepositorioPoi.instance.searchById(Long.parseLong(idPoi))
		
		val usuario = RepositorioUsuarios.instance.searchById(Long.parseLong(idUsuario))
		
			
			try {
				usuario.AgregarFavorito(poi)
				RepositorioUsuarios.instance.update(usuario)
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

