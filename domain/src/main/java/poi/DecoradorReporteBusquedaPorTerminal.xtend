package poi

import java.util.ArrayList
import org.eclipse.xtend.lib.annotations.Accessors

@Accessors
class DecoradorReporteBusquedaPorTerminal extends DecoradorServicioTexto {

	TouchMe terminal
	ArrayList<Integer> resultadosParciales

	new(IBuscarPorTexto componente, TouchMe terminal) {
		super(componente)
		this.terminal = terminal
		this.resultadosParciales = new ArrayList<Integer>()
	}

	override BuscarPorTexto(String texto) {
		this.listaDePois = this.componenteDecorado.BuscarPorTexto(texto)
		this.resultadosParciales.add(this.listaDePois.size)
		this.listaDePois
	}
}
