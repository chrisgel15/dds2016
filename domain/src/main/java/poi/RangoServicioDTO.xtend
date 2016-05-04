package poi

import org.eclipse.xtend.lib.annotations.Accessors

@Accessors
class RangoServicioDTO {

	int NumeroDia
	int HorarioDesde
	int minutosDesde
	int horarioHasta
	int minutosHasta

	new(int dia, int horDesde, int minDesde, int horHasta, int minHasta) {
		this.NumeroDia = dia
		this.HorarioDesde = horDesde
		this.minutosDesde = minDesde
		this.horarioHasta = horHasta
		this.minutosHasta = minHasta
	}

}
