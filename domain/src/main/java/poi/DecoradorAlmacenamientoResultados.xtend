package poi

class DecoradorAlmacenamientoResultados extends DecoradorServicioTexto {
	
	String fraseBuscada
	int cantidadDeResultados
	double tiempoDemoraConsulta
	
	new(IBuscarPorTexto componente) {
		super(componente)
	}
	
	override BuscarPorTexto(String texto) {
		this.fraseBuscada = texto
		this.listaDePois = componenteDecorado.BuscarPorTexto(texto)
		this.tiempoDemoraConsulta = componenteDecorado.CalcularTiempoDeBusqueda()
		this.cantidadDeResultados = this.listaDePois.size		
		this.listaDePois		
	}
	
}