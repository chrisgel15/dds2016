package poi

import org.joda.time.LocalDate
import org.eclipse.xtend.lib.annotations.Accessors
import org.joda.time.format.DateTimeFormatter
import org.joda.time.format.DateTimeFormat

@Accessors
class BajaPois
{
	String valorDeBusqueda
	LocalDate fechaDeBaja
	
	new(String valorDeBusqueda, String fechaDeBaja)
	{
		this.valorDeBusqueda = valorDeBusqueda
		var DateTimeFormatter dtf = DateTimeFormat.forPattern("dd-MM-yyyy");
		this.fechaDeBaja = dtf.parseLocalDate(fechaDeBaja);
	}
}