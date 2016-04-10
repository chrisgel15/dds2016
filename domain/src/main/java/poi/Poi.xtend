package poi

import org.uqbar.geodds.Point

//import org.uqbar.geodds.Polygon

class Poi {
	
	Point localizacionPropia
	String nombre
	//Direccion direccion
	
	new (Point p, String nom)
	{
		this.localizacionPropia = p
		this.nombre = nom	
	}	
	
	def DistanciaAOtroPoiMenorA(Poi destino, double distancia)
	{
		DistanciaEntrePuntos(destino) < distancia
	}
	
	def DistanciaEntrePuntos(Poi destino) {
		Haversine.distance(localizacionPropia.latitude , localizacionPropia.longitude , destino.localizacionPropia.latitude , destino.localizacionPropia.longitude)
	}
	
	def EsValido()
	{
		!(localizacionPropia == null && nombre.isNullOrEmpty())
	}
	
	
}
