package poi

class ConfiguracionErrorMail implements IConfiguracionProcesoError {

	String mail;

	new(String mail) {
		this.mail = mail
	}

	override EjecucionAnteError(IProceso proceso) {
		this.EnviarMail(mail)
	}

	def void EnviarMail(String mail) {
		//TODO
	}

}
