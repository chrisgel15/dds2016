package poi

import java.util.HashMap
import java.util.Map

class SingletonReporteTotalPorUsuario {

	private static SingletonReporteTotalPorUsuario Instance = null
	Map<TouchMe, Integer> reportePorUsuario

	private new() {
		this.reportePorUsuario = new HashMap<TouchMe, Integer>()
	}

	def public static SingletonReporteTotalPorUsuario getInstance() {
		if (Instance == null)
			Instance = new SingletonReporteTotalPorUsuario()

		Instance
	}

	def addTouchMe(TouchMe me) {
		this.reportePorUsuario.put(me, 0)
	}
	
	def addBusquedas(TouchMe me, Integer cantidadBusquedas)
	{
		var Integer valor = this.reportePorUsuario.get(me)
		this.reportePorUsuario.put(me, valor + cantidadBusquedas)
	}
	def int cantidadDeBusquedasDelUsuario(TouchMe me){
		var int cantidad
		cantidad = this.reportePorUsuario.get(me)
	}
}
