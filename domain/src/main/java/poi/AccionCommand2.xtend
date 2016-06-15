package poi

class AccionCommand2 implements IAccionCommand {
	
	Accion2 accion
	
	new(Accion2 accion) {
		this.accion = accion
	}
	
	override EjecutarAccion() {
		this.accion.EjecutarAccion2()
	}
}