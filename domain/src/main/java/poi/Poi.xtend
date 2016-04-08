package poi

import org.uqbar.geodds.Point
//import org.uqbar.geodds.Polygon

class Poi {

	Point localizacion
	String nombre
	//Direccion direccion
	
	new (Point p, String nom)
	{
		this.localizacion = p
		this.nombre = nom	
	}	
	
	def DistanciaAOtroPoiMenorA(Poi p, int distancia)
	{
		Haversine.distance(localizacion.latitude , localizacion.longitude , p.localizacion.latitude , p.localizacion.longitude) - distancia
	}
	
	def EsValido()
	{
		!(localizacion == null && nombre.isNullOrEmpty())
	}
}
