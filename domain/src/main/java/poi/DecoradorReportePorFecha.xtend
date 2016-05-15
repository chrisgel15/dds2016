package poi

import java.util.HashMap
import java.util.Map
import org.joda.time.LocalDate

class DecoradorReportePorFecha extends DecoradorServicioTexto {

	Map<LocalDate, Integer> busquedasPorFecha

	new(IBuscarPorTexto componente) {
		super(componente)
		this.busquedasPorFecha = new HashMap<LocalDate, Integer>()
	}

	override BuscarPorTexto(String texto) {
		this.listaDePois = componenteDecorado.BuscarPorTexto(texto)
		this.CuentaBusqueda()
		this.listaDePois
	}

	def CuentaBusqueda() {
		var diaActual = new LocalDate()
		if (this.busquedasPorFecha.containsKey(diaActual)) {
			var valor = this.busquedasPorFecha.get(diaActual)
			this.busquedasPorFecha.put(diaActual, valor++)
		} else {
			this.busquedasPorFecha.put(diaActual, 1)
		}
	}
}
