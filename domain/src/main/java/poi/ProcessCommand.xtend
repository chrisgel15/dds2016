package poi

class ProcessCommand {

	IProceso proceso

	new(IProceso proc) {
		proceso = proc
	}

	def EjecutarProceso() {
		this.proceso.Ejecutar()
	}

}
