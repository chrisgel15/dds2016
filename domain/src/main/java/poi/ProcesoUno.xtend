package poi

class ProcesoUno extends Proceso implements IProceso  {
	
	new(String nombre, IConfiguracionProcesoError configuracionError) {
		super(nombre, configuracionError)
	}
	
	override Ejecutar() {
		try
		{
			// this.ejecutarProcesoUno()
		}
		catch (Exception ex)
		{
			
		}
	}
	
}