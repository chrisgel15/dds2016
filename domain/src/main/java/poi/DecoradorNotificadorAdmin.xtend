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
		if(tiempoDeBusqueda>tiempoMaximo){
			enviarMailDeNotificacion(crearMailDeNotificación())
		}	
	}
	def Mail crearMailDeNotificación(){
		var Mail mail
		mail = new Mail("DecoratorNotidificador", "administrador@admin.com", "Se supero el tiempo máximo de busqueda","Alerta notificación de tiempo de busqueda")	
	}
	def void enviarMailDeNotificacion(Mail mail){
		var MailSender mailSender
		mailSender.send(mail)
	}
	
}
