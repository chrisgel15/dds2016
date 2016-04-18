package poi

class Muebleria implements IRubro {
	
	static double DISTANCIA_MUEBLERIA = 0.5
	
	String nombre
	
	new (String nombre)
	{
		this.nombre = nombre
	}
	
	override getRadioCercania() {
		DISTANCIA_MUEBLERIA
	}
	
	override getNombre() {
		this.nombre
	}
	
		

}
