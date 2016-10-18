//package poi.Factories
package poi

import org.eclipse.xtend.lib.annotations.Accessors
import poi.Comuna

@Accessors
class ComunaFactory {
	
	Comuna comunaAlmagro
	Comuna comuna13
	PointFactory pointFactory
	
	new()
	{
		pointFactory = new PointFactory()
		
		comunaAlmagro = new Comuna("comuna_almagro", pointFactory.puntoVertice1, pointFactory.puntoVertice2, pointFactory.puntoVertice3)
		comuna13 = new Comuna("Comuna13 Test", pointFactory.puntoVertice1, pointFactory.puntoVertice2, pointFactory.puntoVertice3)
	}
	
}