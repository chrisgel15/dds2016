package poi

import java.util.List
import org.eclipse.xtend.lib.annotations.Accessors

@Accessors
class ProcesoDos extends Proceso implements IProceso {

	public ServicioExternoBajaPois servicio
	public RepositorioPoi poiRepository

	new(String nombre, IConfiguracionProcesoError configuracionError) {
		super(nombre, configuracionError)
		this.servicio = new ServicioExternoBajaPois()
		this.poiRepository = new RepositorioPoi()
	}

	override Ejecutar() {
		try {
			// Manejamos el nombre de usuario?
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
			this.getConfiguracionError().EjecucionAnteError(this)
		}
	}

	def void EjecutarProcesoDos() {
		var List<BajaPois> listaBaja
		try {
			listaBaja = this.getServicio().EjecutarServicioGCBA()
		} catch (Exception ex) {
			throw new ProcesoDosServicioGCBAException("Error al ejecutar el servicio GCBA")
		}

		listaBaja.forEach[baja|EliminaPoi(baja)]
	}

	def EliminaPoi(BajaPois pois) {
		var List<Poi> lista;
		try {
			lista = this.getPoiRepository().BuscarPorTexto(pois.valorDeBusqueda)
		} catch (Exception ex) {
			throw new ProcesoDosBuscarPorTextoException("Error al Buscar en el repositorio de Pois")
		}
		lista.forEach[poi|EliminaPoi(poi)]
	}

	def EliminaPoi(Poi poi) {
		this.getPoiRepository().delete(poi)
	}

}

enum EstadoProceso {
	NO_EJECUTADO,
	OK,
	ERROR
}
