package poi

import java.util.ArrayList
import java.util.List
import org.eclipse.xtend.lib.annotations.Accessors
import org.uqbar.geodds.Point

@Accessors
class ServicioExternoCGP {

	List<CentroDTO> listaDTO = new ArrayList<CentroDTO>()
	List<CGP> pois = new ArrayList<CGP>()
	AdapterCGP adapter
	Point puntoCero

	def List<CGP> BuscarPorTexto(String texto) {
		this.Map(listaDTO)
	// Debe retornar una lista de Pois...
	}

	def List<CGP> Map(List<CentroDTO> dtoCGPs) {
		// Aca se mapea el CentroDTO que viene del servicio externo a nuestro dominio...	
		adapter = new AdapterCGP	
		adapter.adaptarCGP(dtoCGPs)
	}
}
