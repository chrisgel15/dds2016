package poi

import org.joda.time.DateTime

interface IUbicable {

	// TODO: definir parametros
	def boolean ConsultaCercania(Poi origen)

	// TODO: definir parametros
	def boolean ConsultaDisponibilidad(DateTime horario)

	// TODO: definir parametros
	def Poi BusquedaPorTexto(String texto)

}
