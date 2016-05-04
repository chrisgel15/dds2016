package poi

import poi.Factories.CGPDtoFactory
import java.util.List
import org.junit.Before
import org.junit.Test
import org.junit.Assert

class CGPMapTestSuite {

	CGPDtoFactory dtoFactory
	ServicioExternoCGP servicioCgp
	List<CGP> respuestaPois

	@Before
	def void init() {
		dtoFactory = new CGPDtoFactory()
		servicioCgp = new ServicioExternoCGP()
	}

	@Test
	def void testMapCgpDto() {
		respuestaPois = servicioCgp.Map(dtoFactory.arrayDto)

		Assert.assertEquals(2, respuestaPois.size);

		Assert.assertEquals(respuestaPois.get(0).servicios.get(0).nombre, dtoFactory.centroDto1.serviciosDTO.get(0).nombreServicio)
		
		Assert.assertEquals(respuestaPois.get(1).servicios.get(0).nombre, dtoFactory.centroDto1.serviciosDTO.get(0).nombreServicio)

	}
	
	@Test(expected=IndexOutOfBoundsException)
	def void testIndexOutOfBoundsException() {
		respuestaPois = servicioCgp.Map(dtoFactory.arrayDto)
		
		respuestaPois.get(2)
    }

}
