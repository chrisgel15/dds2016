package poi

import org.joda.time.DateTime

interface IUbicable {

	// TODO: definir parametros
	def boolean ConsultaCercania(PoiBase origen)

	// TODO: definir parametros
	def boolean ConsultaDisponibilidad(DateTime horario)

	// TODO: definir parametros
	def boolean BusquedaPorTexto(String texto)

}
