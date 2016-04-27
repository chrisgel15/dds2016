package poi.Factories

import org.eclipse.xtend.lib.annotations.Accessors
import poi.Comuna

@Accessors
class ComunaFactory {
	
	Comuna comunaAlmagro
	PointFactory pointFactory
	
	new()
	{
		pointFactory = new PointFactory()
		
		comunaAlmagro = new Comuna("comuna_almagro", pointFactory.puntoVertice1, pointFactory.puntoVertice2, pointFactory.puntoVertice3)
	}
	
}