package poi

abstract class DecoradorServicioTexto implements IBuscarPorTexto {
	
	protected IBuscarPorTexto componente
	
	override BuscarPorTexto(String texto) {
		componente.BuscarPorTexto(texto)
	}
}