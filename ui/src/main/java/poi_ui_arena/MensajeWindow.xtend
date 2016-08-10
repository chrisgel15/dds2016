package poi_ui_arena

import org.uqbar.arena.windows.SimpleWindow
import poi.BusquedaUI
import org.uqbar.arena.windows.WindowOwner
import org.uqbar.arena.widgets.Panel
import org.uqbar.arena.widgets.Label
import org.uqbar.arena.widgets.TextBox
import org.uqbar.arena.widgets.Button
import static extension org.uqbar.arena.xtend.ArenaXtendExtensions.*
import org.uqbar.arena.layout.HorizontalLayout
import poi.CriterioBusqueda

class MensajeWindow extends SimpleWindow<BusquedaUI>{
	new(WindowOwner owner, BusquedaUI modelo){
		super(owner,modelo)
		title = "Mensaje"
		
	}
	
	override createContents(Panel mainPanel){
		new Label(mainPanel).text = "No hemos podido utilizar la clase Factory para generar muchos Pois (por un error que arrojaba Arena). Se utilizan Pois creados manualmente."
	}
	
	override protected addActions(Panel actionsPanel) {
		throw new UnsupportedOperationException("TODO: auto-generated method stub")
	}
	
	override protected createFormPanel(Panel mainPanel) {
		throw new UnsupportedOperationException("TODO: auto-generated method stub")
	}
	
}