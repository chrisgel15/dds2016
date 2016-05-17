package poi

class DecoradorNotificadorAdmin extends DecoradorServicioTexto {

	int tiempoMaximo
	double tiempoDeBusqueda

	new(IBuscarPorTexto c, int tiempoMaximo) {
		super(c)
		this.tiempoMaximo = tiempoMaximo
	}

	override BuscarPorTexto(String texto) {
		componenteDecorado.BuscarPorTexto(texto)
		this.NotificarAdministrador()
		this.listaDePois
	}

	def NotificarAdministrador() {
		tiempoDeBusqueda = DecoradorHelper.elapsedSeconds(componenteDecorado.momentoInicial,
			componenteDecorado.momentoFinal)
	// Juan, implementate la notificacion por mail al Admin (con el ejemplo visto en otras clases)
	}
}
