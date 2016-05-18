package poi

import org.eclipse.xtend.lib.annotations.Accessors

@Accessors
class DecoradorReporteTotalesPorUsuario extends DecoradorServicioTexto {
	
	SingletonReporteTotalPorUsuario reporte
	TouchMe decoradorTouchMe
	
	new(IBuscarPorTexto componente, TouchMe touchMe) {
		super(componente)
		this.decoradorTouchMe = touchMe
		this.reporte = SingletonReporteTotalPorUsuario.instance
		this.reporte.addTouchMe(touchMe)
	}
	
	override BuscarPorTexto(String texto)
	{
		this.listaDePois = this.componenteDecorado.BuscarPorTexto(texto)
		this.reporte.addBusquedas(this.decoradorTouchMe, this.listaDePois.size)
		this.listaDePois		
	}
}