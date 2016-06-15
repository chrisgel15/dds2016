package poi

import java.util.List
import java.util.ArrayList

class AlmacenamientoProcesoResultado {

	static AlmacenamientoProcesoResultado Instance = null

	List<ProcesoResultado> resultados

	private new() {
		this.resultados = new ArrayList<ProcesoResultado>()
	}

	def public static AlmacenamientoProcesoResultado getInstance() {
		if (Instance == null)
			Instance = new AlmacenamientoProcesoResultado()
		Instance
	}

	def public GuardarResultado(ProcesoResultado res) {
		resultados.add(res)
	}

}
