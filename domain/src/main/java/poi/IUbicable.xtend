package poi

interface IUbicable {

	// TODO: definir parametros
	def boolean ConsultaCercania(Poi origen, Poi destino)

	// TODO: definir parametros
	def boolean ConsultaDisponibilidad()

	// TODO: definir parametros
	def Poi BusquedaPorTexto(Poi poi, String texto)

}
