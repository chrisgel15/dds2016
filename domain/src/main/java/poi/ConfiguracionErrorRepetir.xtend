package poi

import org.eclipse.xtend.lib.annotations.Accessors

@Accessors
class ConfiguracionErrorRepetir implements IConfiguracionProcesoError {

	public int CantidadEjecuciones

	new(int CantidadEjecuciones) {
		this.CantidadEjecuciones = CantidadEjecuciones
	}

	override EjecucionAnteError(IProceso proceso) {
		// Repetir la ejecucion
		if (this.CantidadEjecuciones > 0) {
			this.CantidadEjecuciones -= 1
			proceso.Ejecutar();
		}
	}

}
