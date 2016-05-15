package poi

import java.util.List
import org.eclipse.xtend.lib.annotations.Accessors
import java.util.ArrayList

@Accessors
class BuscadorDePuntosService implements IBuscarPorTexto {

	public RepositorioPoi poiRepository = new RepositorioPoi
	public ServicioExternoCGP servicioExtCGP = new ServicioExternoCGP
	public ServicioExternoBancos servicioExtBancos = new ServicioExternoBancos
	private List<Poi> listaRepository
	List<CGP> listaCGP
	List<Banco> listaBancos
	public int duracionBusqueda

	override List<Poi> BuscarPorTexto(String texto) {
		
		listaRepository = this.poiRepository.BuscarPorTexto(texto) ?: new ArrayList<Poi>()
		listaCGP = this.servicioExtCGP.BuscarPorTexto(texto) ?: new ArrayList<CGP>()
		listaBancos = this.servicioExtBancos.BuscarPorTexto(texto) ?: new ArrayList<Banco>()

		listaRepository.addAll(listaCGP)
		listaRepository.addAll(listaBancos)
		listaRepository

	}
	
	override CalcularTiempoDeBusqueda() {
		duracionBusqueda
	}

}
