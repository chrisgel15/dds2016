package poi

import java.util.List
import org.eclipse.xtend.lib.annotations.Accessors
import java.util.ArrayList
import org.joda.time.DateTime

@Accessors
class BuscadorDePuntosService implements IBuscarPorTexto {

	public RepositorioPoi poiRepository = new RepositorioPoi
	public ServicioExternoCGP servicioExtCGP = new ServicioExternoCGP
	public ServicioExternoBancos servicioExtBancos = new ServicioExternoBancos
	private List<Poi> listaRepository
	List<CGP> listaCGP
	List<Banco> listaBancos
	//public double duracionBusqueda
	DateTime inicioBusqueda
	DateTime finBusqueda

	override List<Poi> BuscarPorTexto(String texto) {

		this.inicioBusqueda = DateTime.now
		listaRepository = this.poiRepository.BuscarPorTexto(texto) ?: new ArrayList<Poi>()
		listaCGP = this.servicioExtCGP.BuscarPorTexto(texto) ?: new ArrayList<CGP>()
		listaBancos = this.servicioExtBancos.BuscarPorTexto(texto) ?: new ArrayList<Banco>()
		this.finBusqueda = DateTime.now

		listaRepository.addAll(listaCGP)
		listaRepository.addAll(listaBancos)
		listaRepository

	}
	
	override getMomentoInicial() {
		this.inicioBusqueda
	}
	
	override getMomentoFinal() {
		this.finBusqueda
	}

//	override CalcularTiempoDeBusqueda() {
//		this.elapsedSeconds(this.inicioBusqueda, this.finBusqueda)
//	}
//
//	private def double elapsedSeconds(DateTime start, DateTime stop) {
//		var interval = new Interval(start, stop)
//		var long milliseconds = interval.toDurationMillis()
//		(milliseconds / 1000 )
//	}

}
