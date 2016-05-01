package poi

import org.apache.commons.collections15.Predicate
import org.uqbar.commons.model.CollectionBasedRepo
import java.util.List

class RepositorioPoi extends CollectionBasedRepo<Poi> {

	override protected Predicate<Poi> getCriterio(Poi example) {
		throw new UnsupportedOperationException("TODO: auto-generated method stub")
	}

	override getEntityType() {
		typeof(Poi)
	}

	def search(String texto) {
		allInstances.filter[poi|poi.BusquedaPorTexto(texto)].toList
	}
	
	override createExample() {
		throw new UnsupportedOperationException("TODO: auto-generated method stub")
	}
	
	def List<Poi> BuscarPorTexto(String texto)
	{
		this.search(texto)
	}
	
}
