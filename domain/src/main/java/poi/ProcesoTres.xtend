package poi

class ProcesoTres extends Proceso implements IProceso {
	
	new(String nombre, IConfiguracionProcesoError configuracionError) {
		super(nombre, configuracionError)
	}
	
	override Ejecutar() {
		try
		{
			// this.ejecutarProcesoTres()
		}
		catch (Exception ex)
		{
			
		}
	}
	
}