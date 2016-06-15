package poi

import java.util.List

class ProcesoDos extends Proceso implements IProceso {

	ServicioExternoBajaPois servicio
	RepositorioPoi poiRepository

	new(String nombre, IConfiguracionProcesoError configuracionError) {
		super(nombre, configuracionError)
		this.servicio = new ServicioExternoBajaPois()
		this.poiRepository = new RepositorioPoi()
	}

	override Ejecutar() {
		try {
			// Que onda con el nombre de usuario?
			this.IniciarProceso(nombreProceso, "")
			this.EjecutarProcesoDos()
			this.ActualizarEstadoOK()
		} catch (ProcesoDosServicioGCBAException ex) {
			this.ActualizarEstadoError(ex.message)
		} catch (ProcesoDosBuscarPorTextoException ex) {
			this.ActualizarEstadoError(ex.message)
		} catch (Exception ex) {
			this.ActualizarEstadoError("Error desconocido")
		} finally {
			this.configuracionError.EjecucionAnteError(this)
		}
	}

	def void EjecutarProcesoDos() {
		var List<BajaPois> listaBaja
		try {
			listaBaja = this.servicio.EjecutarServicioGCBA()
		} catch (Exception ex) {
			throw new ProcesoDosServicioGCBAException("Error al ejecutar el servicio GCBA")
		}

		listaBaja.forEach[baja|BuscaPoi(baja)]
	}

	def BuscaPoi(BajaPois pois) {
		var List<Poi> lista;
		try {
			lista = this.poiRepository.BuscarPorTexto(pois.valorDeBusqueda)
		} catch (Exception ex) {
			throw new ProcesoDosBuscarPorTextoException("Error al Buscar en el repositorio de Pois")
		}
		lista.forEach[poi|this.poiRepository.delete(poi)]
	}

}

class ProcesoDosServicioGCBAException extends Exception {
	new(String msg) {
		super(msg)
	}
}

class ProcesoDosBuscarPorTextoException extends Exception {
	new(String msg) {
		super(msg)
	}
}

enum EstadoProceso {
	NO_EJECUTADO,
	OK,
	ERROR
}
