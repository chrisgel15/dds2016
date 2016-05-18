package poi

import java.util.ArrayList
import org.eclipse.xtend.lib.annotations.Accessors

@Accessors
class DecoradorAlmacenamientoResultados extends DecoradorServicioTexto {

	ArrayList<DecoradorAlmacenDeResultados> almacen
	TouchMe touchMe

	new(IBuscarPorTexto componente, TouchMe touch) {
		super(componente)
		this.almacen = new ArrayList<DecoradorAlmacenDeResultados>()
		this.touchMe = touch
	}

	override BuscarPorTexto(String texto) {
		this.listaDePois = componenteDecorado.BuscarPorTexto(texto)
		var double tiempoDemora = DecoradorHelper.elapsedSeconds(componenteDecorado.momentoInicial,
			componenteDecorado.momentoFinal)
		GeneraResultado(texto, tiempoDemora)

		this.listaDePois
	}

	def private GeneraResultado(String texto, double tiempoDemora) {
		var aux = new DecoradorAlmacenDeResultados(
			texto,
			this.listaDePois.size,
			tiempoDemora
		)

		this.almacen.add(aux)
	}

}
