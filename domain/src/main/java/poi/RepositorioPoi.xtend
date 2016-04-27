package poi

import org.uqbar.commons.model.CollectionBasedRepo
import org.apache.commons.collections15.Predicate
import org.uqbar.geodds.Point

class RepositorioPoi extends CollectionBasedRepo<Poi> {

	override protected Predicate<Poi> getCriterio(Poi example) {
		throw new UnsupportedOperationException("TODO: auto-generated method stub")
	}

	override createExample() {
		new Poi(new Point(0, 0), "")
	}

	override getEntityType() {
		typeof(Poi)
	}

	def search(String texto) {
		allInstances.filter[poi|poi.BusquedaPorTexto(texto)].toList
	}
}
