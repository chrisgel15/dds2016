package poi.Factories

import java.util.List
import poi.ProcessCommand
import java.util.ArrayList

class Administrador {

	String nombre
	List<ProcessCommand> procesos

	new(String nom) {
		this.nombre = nom
		procesos = new ArrayList<ProcessCommand>()
	}

	def AgregarProceso(ProcessCommand processCmd) {
		this.procesos.add(processCmd)
	}

	def EjecutarProcesos() {
		procesos.forEach[proceso|proceso.EjecutarProceso()]
	}

}
