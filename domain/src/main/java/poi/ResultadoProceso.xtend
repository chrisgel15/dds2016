package poi

import org.joda.time.DateTime
import org.eclipse.xtend.lib.annotations.Accessors

@Accessors
class ResultadoProceso {
	
	DateTime Inicio
	DateTime Fin
	String NombreProceso
	String NombreUsuario
	String Resultado
	String Mensaje
	
	new (DateTime inicio, String nombreProceso, String nombreUsuario )
		{
			this.Inicio = inicio;
			this.NombreProceso = nombreProceso;
			this.NombreUsuario = nombreUsuario;
		}
	
}