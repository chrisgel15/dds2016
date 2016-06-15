package poi

import org.joda.time.LocalDate
import org.eclipse.xtend.lib.annotations.Accessors

@Accessors
class Proceso {

	String nombreProceso
	IConfiguracionProcesoError configuracionError
	public AlmacenamientoProcesoResultado almacenamiento = AlmacenamientoProcesoResultado.instance
	public ProcesoResultado resultado;
	public EstadoProceso estado;

	new(String nombre, IConfiguracionProcesoError configuracionError) {
		this.nombreProceso = nombre
		this.configuracionError = configuracionError
		this.estado = EstadoProceso.NO_EJECUTADO
	}

	def IniciarProceso(String nombreProceso, String nombreUsuario) {
		resultado = new ProcesoResultado(new LocalDate(), nombreProceso, nombreUsuario)
	}

	def ActualizarEstadoOK() {
		this.resultado.Fin = new LocalDate()
		this.resultado.Resultado = "OK"
		this.resultado.Mensaje = "Se ejecuto correctamente."
		this.estado = EstadoProceso.OK
		this.GuardarResultado()
	}

	def ActualizarEstadoError(String mensaje) {
		this.resultado.Fin = new LocalDate()
		this.resultado.Resultado = "Error"
		this.resultado.Mensaje = mensaje
		this.estado = EstadoProceso.ERROR
		this.GuardarResultado()
	}

	private def GuardarResultado() {
		almacenamiento.GuardarResultado(resultado)
	}

}
