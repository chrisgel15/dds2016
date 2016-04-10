package poi

class CGP extends GenericPoi {

	Comuna comuna

	// Un CGP tiene una referencia a su comuna
	new(Comuna comuna) {
		this.comuna = comuna
	}

	override ConsultaDisponibilidad() {
		throw new UnsupportedOperationException("TODO: auto-generated method stub")
	}

	override BusquedaPorCriterio() {
		throw new UnsupportedOperationException("TODO: auto-generated method stub")
	}

	// Para saber si un CGP esta cerca, debe chequear que esté en la misma comuna que el origen.
	override ConsultaCercania(Poi origenTouchMe, Poi destinoCGP) {
		this.comuna.AmbosPuntosPertenecen(origenTouchMe.locacionPropia, destinoCGP.locacionPropia)
	}

}
