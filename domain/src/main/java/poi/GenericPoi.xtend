package poi

abstract class GenericPoi implements IUbicable {
	
	static double DISTANCIA_GENERAL = 0.5
	// TODO: Comportamiento general de los tipos concretos
	override boolean ConsultaCercania(Poi origen, Poi destino)
	{
		origen.DistanciaAOtroPoiMenorA(destino, DISTANCIA_GENERAL)
	}
	
}