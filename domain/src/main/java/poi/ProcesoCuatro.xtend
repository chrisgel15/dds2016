package poi

import java.util.List
import java.util.ArrayList
import org.eclipse.xtend.lib.annotations.Accessors

@Accessors
class ProcesoCuatro extends Proceso implements IProceso {

	public List<IProceso> procesos

	new(String nombre, IConfiguracionProcesoError configuracionError) {
		super(nombre, configuracionError)
		procesos = new ArrayList<IProceso>
	}

	override Ejecutar() {
		try {
			ejecutarProceso4()
			ActualizarEstadoOK()
			
		} 
		catch (ProcesoCompuestoFallaAlgunProcesoSimple ex) {
			ActualizarEstadoError(ex.message)
			configuracionError.EjecucionAnteError(this)
		}
		almacenamiento.GuardarResultado(resultado)
	}

	def ejecutarProceso4() {
		try{
			procesos.forEach[proceso|proceso.Ejecutar()]
		}
		catch(Exception ex){
			throw new ProcesoCompuestoFallaAlgunProcesoSimple("Hubo error en algun subproceso")
		}
		
	}

}


class ProcesoCompuestoFallaAlgunProcesoSimple extends Exception{
	new(String msg) {
		super(msg)
	}
}
