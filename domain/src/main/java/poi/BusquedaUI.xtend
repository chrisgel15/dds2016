package poi

import org.uqbar.commons.utils.Observable
import org.eclipse.xtend.lib.annotations.Accessors
import java.util.List
import java.util.ArrayList

@Accessors
@Observable
class BusquedaUI {

	List<CriterioBusqueda> criterios

	new() {
		criterios = new ArrayList<CriterioBusqueda>();
	}
	
	def CriterioBusqueda AgregarCriterio()
	{
		var CriterioBusqueda aux = new CriterioBusqueda()
		criterios.add(aux)		
		aux
	}
}

@Accessors
class CriterioBusqueda {
	String criterioBusqueda

	new() {
		criterioBusqueda = ""
	}
}
