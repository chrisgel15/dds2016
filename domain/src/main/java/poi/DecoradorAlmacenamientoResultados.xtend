package poi

import org.eclipse.xtend.lib.annotations.Accessors

@Accessors
class DecoradorAlmacenamientoResultados extends DecoradorServicioTexto {

	String fraseBuscada
	int cantidadDeResultados
	double tiempoDemoraConsulta

	new(IBuscarPorTexto componente) {
		super(componente)
	}

	override BuscarPorTexto(String texto) {
		this.fraseBuscada = texto
		componenteDecorado.BuscarPorTexto(texto)
		this.tiempoDemoraConsulta = DecoradorHelper.elapsedSeconds(componenteDecorado.momentoInicial,
			componenteDecorado.momentoFinal)
		this.cantidadDeResultados = this.listaDePois.size
		this.listaDePois
	}

}
