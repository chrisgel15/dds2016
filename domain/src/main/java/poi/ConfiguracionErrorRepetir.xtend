package poi

class ConfiguracionErrorRepetir implements IConfiguracionProcesoError {

	int CantidadEjecuciones

	new(int CantidadEjecuciones) {
		this.CantidadEjecuciones = CantidadEjecuciones
	}

	override EjecucionAnteError(IProceso proceso) {
		// Repetir la ejecucion
		// if (this.CantidadEjecuciones > 0)
	}

}
