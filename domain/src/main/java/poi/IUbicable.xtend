package poi

interface IUbicable {

	// TODO: definir parametros
	def boolean ConsultaCercania(PoiBase origen)

	// TODO: definir parametros
	def boolean ConsultaDisponibilidad(ServicioYHorario servicioYHorario)

	// TODO: definir parametros
	def boolean BusquedaPorTexto(String texto)

}
