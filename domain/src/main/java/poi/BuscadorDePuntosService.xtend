package poi

import java.util.List

class BuscadorDePuntosService {

	static BuscadorDePuntosService Instance = null
	private RepositorioPoi poiRepository = new RepositorioPoi
	private ServicioExternoCGP servicioExtCGP = new ServicioExternoCGP
	private ServicioExternoBancos servicioExtBancos = new ServicioExternoBancos
	List<Poi> listaRepository
	List<Poi> listaCGP
	List<Poi> listaBancos

	private new() {
	}

	def public static BuscadorDePuntosService getInstance() {
		if (Instance == null) {
			Instance = new BuscadorDePuntosService()
		}

		Instance
	}

	def List<Poi> BuscarPorTexto(String texto) {
		listaRepository = Instance.poiRepository.BuscarPorTexto(texto)
		listaCGP = Instance.servicioExtCGP.BuscarPorTexto(texto)
		listaBancos = Instance.servicioExtBancos.BuscarPorTexto(texto)

	}

}
