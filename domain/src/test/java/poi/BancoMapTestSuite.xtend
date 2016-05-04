package poi

import org.junit.Before
import poi.Factories.JsonBancoFactory
import org.junit.Test
import java.util.List
import org.junit.Assert

class BancoMapTestSuite {
	
	JsonBancoFactory jsonFactory
	ServicioExternoBancos servicioBancos
	List<Poi> respuestaPois
	
	@Before
	def void init()
	{
		jsonFactory = new JsonBancoFactory()
		servicioBancos = new ServicioExternoBancos()		
	}
	
	@Test
	def void testMapBancoJson()
	{
		respuestaPois = servicioBancos.Map(jsonFactory.jsonBancoArray)
		
		Assert.assertEquals(respuestaPois.size, 2);	
		
		Assert.assertTrue(StringHelper.ComparaStrings(respuestaPois.get(0).nombre,
			jsonFactory.jsonBanco1.get("banco").asString()
		))
		
		Assert.assertTrue(StringHelper.ComparaStrings(respuestaPois.get(1).nombre,
			jsonFactory.jsonBanco2.get("banco").asString()
		))		
	}
}