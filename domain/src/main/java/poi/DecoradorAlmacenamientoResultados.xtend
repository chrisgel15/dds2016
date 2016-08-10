package poi

import java.util.ArrayList
import org.eclipse.xtend.lib.annotations.Accessors

@Accessors
class DecoradorAlmacenamientoResultados extends DecoradorServicioTexto {

	ArrayList<ResultadoDeBusqueda> resultados

	new(IBuscarPorTexto componente) {
		super(componente)
		this.resultados = new ArrayList<ResultadoDeBusqueda>()
	}

	override BuscarPorTexto(String texto) {
		this.listaDePois = componenteDecorado.BuscarPorTexto(texto)
		var double tiempoDemora = DecoradorHelper.elapsedSeconds(componenteDecorado.momentoInicial,
			componenteDecorado.momentoFinal)
		GeneraResultado(texto, tiempoDemora)

		this.listaDePois
	}

	def private GeneraResultado(String texto, double tiempoDemora) {
		var aux = new ResultadoDeBusqueda(
			texto,
			this.listaDePois.size,
			tiempoDemora
		)

		this.resultados.add(aux)
	}
	def int cantidadDeBusquedas(){
		resultados.size
	}
	
}
