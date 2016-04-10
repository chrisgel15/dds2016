package poi

import org.joda.time.DateTime

interface IUbicable {

	// TODO: definir parametros
	def boolean ConsultaCercania(Poi origen, Poi destino)

	// TODO: definir parametros
	def boolean ConsultaDisponibilidad(Poi poi, DateTime horario)

	// TODO: definir parametros
	def Poi BusquedaPorTexto(Poi poi, String texto)

}
