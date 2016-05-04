package poi.Factories

import poi.CentroDTO
import java.util.ArrayList
import poi.RangoServicioDTO
import poi.ServicioDTO
import java.util.List

class CGPDtoFactory {
	
	public CentroDTO centroDto1
	public CentroDTO centroDto2
	public ArrayList<CentroDTO> arrayDto
	private CentroDTO auxCentro
	private ServicioDTO auxServicio
	private ServicioDTO auxServicio2
	private List<ServicioDTO> listServicio
	private RangoServicioDTO auxRango
	private RangoServicioDTO auxRango2
	private List<RangoServicioDTO> listRango 
	
	
	new()
	{
		centroDto1 = CreateCgp1();
	//	centroDto2 = CreateCgp2();
		// aca formar el array...
		
	}
	
	def CreateCgp1()
	{
		auxRango = new RangoServicioDTO(1, 9, 0, 18, 0)
		auxRango2 = new RangoServicioDTO(2, 10, 0, 19, 0)
		listRango = new ArrayList<RangoServicioDTO>()
		listRango.add(auxRango)
		listRango.add(auxRango2)
		
		auxServicio = new ServicioDTO("Atencion Ciudadana",listRango)
		listServicio = new ArrayList<ServicioDTO>()
		listServicio.add(auxServicio)
		
		auxCentro = new CentroDTO(3, 34, -23, "Balvanera, San Cristobal","director", "Junin 521", "1234234134",listServicio )
		
		
	}
	
	def CreateCgp2()
	{
	//	aux = new CentroDTO()
		//....		
	}
}