package poi

import org.joda.time.LocalDate
import org.eclipse.xtend.lib.annotations.Accessors

@Accessors
class BajaPois
{
	String valorDeBusqueda
	LocalDate fechaDeBaja
	
	new(String valorDeBusqueda, String fechaDeBaja)
	{
		this.valorDeBusqueda = valorDeBusqueda
		this.fechaDeBaja = new LocalDate(fechaDeBaja)
	}
}