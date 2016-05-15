package poi

import java.util.List

abstract class DecoradorServicioTexto implements IBuscarPorTexto {
	
	protected IBuscarPorTexto componenteDecorado
	protected List<Poi> listaDePois
	
	override BuscarPorTexto(String texto) {
		componenteDecorado.BuscarPorTexto(texto)
	}
	
	new(IBuscarPorTexto componente )
	{
		this.componenteDecorado = componente
	}
	
	override CalcularTiempoDeBusqueda()
	{
		componenteDecorado.CalcularTiempoDeBusqueda()
	}
}