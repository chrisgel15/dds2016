package poi

import org.eclipse.xtend.lib.annotations.Accessors

@Accessors
class DecoradorNotificadorAdmin extends DecoradorServicioTexto {

	double tiempoMaximo
	int enviosAlAdministrador
	double tiempoDeBusqueda
	MailSender mailSender

	new(IBuscarPorTexto c, double tiempoMaximo) {
		super(c)
		this.tiempoMaximo = tiempoMaximo
		enviosAlAdministrador = 0
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
			enviosAlAdministrador+=1
			enviarMailDeNotificacion(crearMailDeNotificación())
			
		}	
	}
	def Mail crearMailDeNotificación(){
		var Mail mail
		mail = new Mail("DecoratorNotidificador", "administrador@poi.com", "Se supero el tiempo máximo de busqueda","Alerta notificación de tiempo de busqueda")	
	}
	def void enviarMailDeNotificacion(Mail mail){
		//mailSender.send(mail)
	}
	
}
