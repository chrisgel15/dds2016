package poi

import poi.Factories.CGPDtoFactory
import java.util.List
import org.junit.Before
import org.junit.Test
import org.junit.Assert

class CGPMapTestSuite {
	
	CGPDtoFactory dtoFactory
	ServicioExternoCGP servicioCgp
	List<Poi> respuestaPois
	
	@Before
	def void init()
	{
		dtoFactory = new CGPDtoFactory()
		servicioCgp = new ServicioExternoCGP()		
	}
	
	@Test
	def void testMapBancoJson()
	{
		respuestaPois = servicioCgp.Map(dtoFactory.arrayDto)
		
		Assert.assertEquals(respuestaPois.size, 2);	
		
		Assert.assertTrue(StringHelper.ComparaStrings(respuestaPois.get(0).nombre,
			dtoFactory.centroDto1.get("banco").asString()
		))
		
		Assert.assertTrue(StringHelper.ComparaStrings(respuestaPois.get(1).nombre,
			dtoFactory.centroDto2.get("banco").asString()
		))		
	}
	
}