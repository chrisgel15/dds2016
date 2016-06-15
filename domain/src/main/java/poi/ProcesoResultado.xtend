package poi

import org.eclipse.xtend.lib.annotations.Accessors
import org.joda.time.LocalDate

@Accessors
class ProcesoResultado {
	
	public LocalDate Inicio
	public LocalDate Fin
	public String NombreProceso
	public String NombreUsuario
	public String Resultado
	public String Mensaje
	
	new (LocalDate inicio, String nombreProceso, String nombreUsuario )
		{
			this.Inicio = inicio;
			this.NombreProceso = nombreProceso;
			this.NombreUsuario = nombreUsuario;
		}
	
}