package poi

import org.eclipse.xtend.lib.annotations.Accessors

@Accessors
class DecoradorAlmacenDeResultados {
	
	String fraseBuscada
	int cantidadDeResultados
	double tiempoDemoraConsulta
	
	new(String fraseBuscada, int cantidadDeResultados, double tiempoDemoraConsulta)
	{
		this.fraseBuscada = fraseBuscada
		this.cantidadDeResultados = cantidadDeResultados
		this.tiempoDemoraConsulta = tiempoDemoraConsulta
	}
	
}