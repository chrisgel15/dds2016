package poi

import java.util.List
import java.util.ArrayList

class ProcesoCuatro extends Proceso implements IProceso {

	public List<IProceso> procesos

	new(String nombre, IConfiguracionProcesoError configuracionError) {
		super(nombre, configuracionError)
		procesos = new ArrayList<IProceso>
	}

	override Ejecutar() {
		try {
			ejecutarProceso4()
		} catch (Exception ex) {
		}
	}

	def ejecutarProceso4() {

		procesos.forEach[proceso|proceso.Ejecutar()]
	}

}
