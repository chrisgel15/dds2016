package poi

import java.util.ArrayList
import java.util.List
import org.eclipse.xtend.lib.annotations.Accessors

@Accessors
class ServicioExternoCGP {
	List<CentroDTO> listaDTO = new ArrayList<CentroDTO>()
	List<CGP> pois = new ArrayList<CGP>()
	AdapterCGP adapter
	

	//Retorna una lista de Pois
	def List<CGP> BuscarPorTexto(String texto) {
		this.Map(listaDTO)
	}

	//Aca se mapea/adapta el CentroDTO que viene del servicio externo a nuestro dominio
	def List<CGP> Map(List<CentroDTO> dtoCGPs) {
		adapter = new AdapterCGP	
		adapter.adaptarCGP(dtoCGPs)
	}
}
