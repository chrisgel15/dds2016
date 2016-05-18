package poi

import java.util.List
import org.joda.time.DateTime

interface IBuscarPorTexto {
	
	def List<Poi> BuscarPorTexto(String texto)
	
	def DateTime getMomentoInicial()
	
	def DateTime getMomentoFinal()

}