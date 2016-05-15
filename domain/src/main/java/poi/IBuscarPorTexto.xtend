package poi

import java.util.List

interface IBuscarPorTexto {
	
	def List<Poi> BuscarPorTexto(String texto)
	
	def int CalcularTiempoDeBusqueda()

}