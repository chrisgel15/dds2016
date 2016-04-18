package poi

class LibreriaEscolar implements IRubro {

	static double DISTANCIA_LIBRERIA_ESCOLAR = 0.5
	
	String nombre
	
	new (String nombre)
	{
		this.nombre = nombre
	}
	
	override getRadioCercania() {
		DISTANCIA_LIBRERIA_ESCOLAR
	}
	
	override getNombre() {
		this.nombre
	}


}
