package poi

class AccionCommand3 implements IAccionCommand {
	
	Accion3 accion
	
	new(Accion3 accion) {
		this.accion = accion
	}
	
	override EjecutarAccion() {
		this.accion.EjecutarAccion3()
	}
}