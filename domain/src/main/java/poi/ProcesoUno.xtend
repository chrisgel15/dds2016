package poi

import java.util.List

class ProcesoUno extends Proceso implements IProceso  {
	
	RepositorioPoi poiRepository
	String texto
	
	new(String nombre, String textoPlano, RepositorioPoi repository, IConfiguracionProcesoError configuracionError) {
		super(nombre, configuracionError)
		poiRepository = repository
		texto = textoPlano
	}
	
	override Ejecutar() {
		try
		{
			this.EjecutarProcesoUno()
		}
		catch (Exception ex)
		{
			
		}
	}
	
	def EjecutarProcesoUno() {
		var List<LocalAActualizar> localesParaActualizar
		localesParaActualizar = this.conversorDeTexto()
		actualizarLocales(localesParaActualizar)	
	}
	
	def actualizarLocales(List<LocalAActualizar> localesAActualizar) {
		localesAActualizar.forEach[local | this.actualizarLocal(local)]
	}
	
	def List<LocalAActualizar> conversorDeTexto(){
		
	}
	
	def void actualizarLocal(LocalAActualizar localParaActualizar){
		var List<Poi> localesAActualizar
		localesAActualizar = buscarLocalAActualizar(localParaActualizar)
		if(!localesAActualizar.empty){
			localesAActualizar.forEach[local | local.setEtiquetas(localParaActualizar.palabrasClave)]
		}
	}
	def List<Poi> buscarLocalAActualizar(LocalAActualizar localParaActualizar){
		poiRepository.BuscarPorTexto(localParaActualizar.nombre)
	}
}