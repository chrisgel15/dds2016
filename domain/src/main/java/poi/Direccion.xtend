package poi

class Direccion {

	String calle
	int altura

	new (String calle, int altura) {
		this.calle = calle
		this.altura = altura
	}
	
	new (String calle)
	{
		this.calle = calle
	}
	
	def getDireccion()
	{
		calle + " " + altura.toString
	}
}