package poi

import java.util.List
import org.eclipse.xtend.lib.annotations.Accessors
import java.util.ArrayList

@Accessors
class BuscadorDePuntosService {

	static BuscadorDePuntosService Instance = null
	public RepositorioPoi poiRepository = new RepositorioPoi
	public ServicioExternoCGP servicioExtCGP = new ServicioExternoCGP
	public ServicioExternoBancos servicioExtBancos = new ServicioExternoBancos
	private List<Poi> listaRepository
	List<CGP> listaCGP
	List<Banco> listaBancos

	private new() {
	}

	def public static BuscadorDePuntosService getInstance() {
		if (Instance == null) {
			Instance = new BuscadorDePuntosService()
		}

		Instance
	}

	def List<Poi> BuscarPorTexto(String texto) {
		listaRepository = Instance.poiRepository.BuscarPorTexto(texto) ?: new ArrayList<Poi>()
		listaCGP = Instance.servicioExtCGP.BuscarPorTexto(texto) ?: new ArrayList<CGP>()
		listaBancos = Instance.servicioExtBancos.BuscarPorTexto(texto) ?: new ArrayList<Banco>()
		
		listaRepository.addAll(listaCGP)
		listaRepository.addAll(listaBancos)
		listaRepository

	}

}
