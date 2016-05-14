package poi

class DecoradorNotificadorAdmin extends DecoradorServicioTexto {
	
	int tiempoMaximo
	
	new(IBuscarPorTexto c, int tiempoMaximo) {
	//	super(c)
		this.tiempoMaximo = tiempoMaximo
		this.componente = c
	}
	
	def NotificarAlAdministrador()
	{
		// ToDo implementar!!!
	}
	
}