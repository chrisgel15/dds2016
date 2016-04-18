package poi

class KioscoDiarios implements IRubro {

	static double DISTANCIA_KIOSCO_DIARIOS = 0.2
	
	String nombre
	
	override getRadioCercania() {
		DISTANCIA_KIOSCO_DIARIOS
	}
	
	new(String nombre)
	{
		this.nombre = nombre
	}
	
	override getNombre() {
		this.nombre
	}

}
