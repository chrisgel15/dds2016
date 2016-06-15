package poi

class AccionCommand1 implements IAccionCommand {
	
	Accion1 accion

	new(Accion1 accion) {
		this.accion = accion
	}

	override EjecutarAccion() {
		this.accion.EjecutarAccion1()
	}
}