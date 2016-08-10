package poi

import org.uqbar.commons.utils.Observable
import org.eclipse.xtend.lib.annotations.Accessors
import java.util.List
import java.util.ArrayList

@Accessors
@Observable
class BusquedaUI {

	List<CriterioBusqueda> criterios
	String textoBusqueda
	RepositorioPoi repo
	List<Poi> resultados

	new() {
		criterios = new ArrayList<CriterioBusqueda>();
	}
	
	def CriterioBusqueda AgregarCriterio()
	{
		var CriterioBusqueda aux = new CriterioBusqueda()
		aux.criterioBusqueda = textoBusqueda
		criterios.add(aux)		
		aux
	}
	
	//TODO: implementar correctamente, no limpia las posiciones de la tabla
	def borrarCriterio(){
		criterios.forEach[criterio | criterio.criterioBusqueda = ""]
		criterios.removeAll
	}
	
	def buscar(){
		criterios.forEach[criterio | repo.BuscarPorTexto(criterio.toString)]
	}
}

@Observable
@Accessors
class CriterioBusqueda {
	String criterioBusqueda

	new() {
		criterioBusqueda = " "
	}
}
