package poi

import java.util.List

abstract class DecoradorServicioTexto implements IBuscarPorTexto {

	protected IBuscarPorTexto componenteDecorado
	protected List<Poi> listaDePois

	new(IBuscarPorTexto componente) {
		this.componenteDecorado = componente
	}

	override BuscarPorTexto(String texto) {
		this.listaDePois = componenteDecorado.BuscarPorTexto(texto)
	}

	override getMomentoInicial() {
		this.componenteDecorado.momentoInicial
	}

	override getMomentoFinal() {
		this.componenteDecorado.momentoFinal
	}

}
