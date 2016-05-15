package poi

class DecoradorNotificadorAdmin extends DecoradorServicioTexto {
	
	int tiempoMaximo
	
	new(IBuscarPorTexto c, int tiempoMaximo) {
		super(c)
		this.tiempoMaximo = tiempoMaximo
	}
	
	override BuscarPorTexto(String texto) {
		this.listaDePois = componenteDecorado.BuscarPorTexto(texto)
		this.NotificarAdministrador()
		this.listaDePois
	}
	
	def NotificarAdministrador() {
		componenteDecorado.CalcularTiempoDeBusqueda()
		// Juan, implementate la notificacion por mail al Admin (con el ejemplo visto en otras clases)
	}
	
}