package poi

import org.joda.time.DateTime
import org.junit.Assert
import org.junit.Before
import org.junit.Test
import org.uqbar.geodds.Point

class DisponibilidadTestSuite {

	Point p1

	Point p2

	Point p3

	CGP cgp1

	Servicio servicio

	@Before
	def void init() {
		p1 = new Point(1, 1)
		p2 = new Point(2, 2)
		p3 = new Point(3, 3)
		cgp1 = new CGP(new Point(0, 0), "CGP 1", new Comuna("Comuna 1", p1, p2, p3))

		servicio = new Servicio("Servicio 1", 1, 9, 18)

		cgp1.AgregaServicio(servicio)
	}

	@Test
	def void testDisponibilidadServicioCGP() {
		Assert.assertTrue(this.cgp1.ConsultaDisponibilidadServicio("Servicio 1", new DateTime(2016,4,11,10,30)))
		
		Assert.assertFalse(this.cgp1.ConsultaDisponibilidadServicio("Servicio 2", new DateTime(2016,4,11,10,30)))
	}

}
