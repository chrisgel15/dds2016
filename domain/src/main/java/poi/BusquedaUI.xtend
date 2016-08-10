package poi

import org.uqbar.commons.utils.Observable
import org.eclipse.xtend.lib.annotations.Accessors
import java.util.List
import java.util.ArrayList
import org.uqbar.geodds.Point

@Accessors
@Observable
class BusquedaUI {

	List<CriterioBusqueda> criterios
	List<Poi> resultadoBusqueda
	String textoBusqueda
	RepositorioPoi repo

	new() {
		criterios = new ArrayList<CriterioBusqueda>();
		resultadoBusqueda = new ArrayList<Poi>()
		this.GenerarRepositorio()
	}
	
	def GenerarRepositorio() {
		val Point = new Point(0,0)
		
		this.repo = new RepositorioPoi()
		repo.create(new Banco(Point, "Banco Galicia"))
		repo.create(new Banco(Point, "Banco Frances"))
		repo.create(new Banco(Point, "Banco Nacion"))
		repo.create(new Banco(Point, "Banco Santander Rio"))
		
		repo.create(new CGP(Point, "CGP Balvanera", new Comuna("C", Point, Point, Point)))
		repo.create(new CGP(Point, "Caballito CGP", new Comuna("C", Point, Point, Point)))
		repo.create(new CGP(Point, "CGP Villa del Parque", new Comuna("C", Point, Point, Point)))
		repo.create(new CGP(Point, "CGP Flore", new Comuna("C", Point, Point, Point)))
		
		
	}
	
	def CriterioBusqueda AgregarCriterio()
	{
		var CriterioBusqueda aux = new CriterioBusqueda()
		aux.criterioBusqueda = textoBusqueda
		criterios.add(aux)	
		textoBusqueda = ""	
		aux
	}
	
	def borrarCriterio(){
		criterios.clear
	}
	
	def limpiarGrilla(){
		resultadoBusqueda.clear
	}
	
	def buscar(){
		resultadoBusqueda.clear
		criterios.forEach[criterio | 
			resultadoBusqueda.addAll(repo.BuscarPorTexto(criterio.criterioBusqueda))
		]
	}
}

@Observable
@Accessors
class CriterioBusqueda {
	String criterioBusqueda

	new() {
		criterioBusqueda = " "
	}
}
