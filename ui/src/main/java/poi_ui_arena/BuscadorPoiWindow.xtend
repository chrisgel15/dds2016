package poi_ui_arena

import org.uqbar.arena.windows.MainWindow
import org.uqbar.arena.windows.ErrorsPanel
import org.uqbar.arena.widgets.Label
import org.uqbar.arena.layout.HorizontalLayout
import org.uqbar.arena.widgets.Panel
import org.uqbar.arena.widgets.TextBox
import static extension org.uqbar.arena.xtend.ArenaXtendExtensions.*
import org.uqbar.arena.windows.SimpleWindow
import org.uqbar.arena.widgets.Button
import poi.BusquedaUI
import org.uqbar.arena.windows.WindowOwner
import poi.CriterioBusqueda
import org.uqbar.arena.Application
import org.uqbar.arena.windows.Window
import org.uqbar.arena.layout.VerticalLayout
import org.uqbar.arena.windows.Dialog

class BuscadorPoiWindow extends SimpleWindow<BusquedaUI>{
	new(WindowOwner owner, BusquedaUI modelo){
		super(owner,modelo)
		
	}
	
	
	
	override createContents(Panel mainPanel){
		new ErrorsPanel(mainPanel,"Listo para buscar")
		val etiqueta = new Label(mainPanel).text = "Criterio de búsqueda"
		val panelBusqueda = new Panel(mainPanel)
		panelBusqueda.layout = new HorizontalLayout
		val panelTextoBusqueda = new Panel(panelBusqueda)
		panelTextoBusqueda.layout = new VerticalLayout
		new Label(panelTextoBusqueda).text = "Nombre"
		
		
		new Button(panelBusqueda) =>[
			caption = "Agregar"
			onClick  [| //var CriterioBusqueda nuevoCriterio = modelObject.AgregarCriterio()
				//this.crearTextBoxPelado(panelTextoBusqueda)
				//etiqueta.text = "cambio el texto"
				new Dialog<?>.open
			]
		]
		
		//new TextBox(panelTextoBusqueda)
		
		
	}
	
	def crearTextBox(Panel unPanel, CriterioBusqueda binding){
		new TextBox(unPanel) => [
			value <=> binding.criterioBusqueda
		]
	}
	
	def crearTextBoxPelado(Panel unPanel){
		new TextBox(unPanel)
	}
	
	override protected addActions(Panel actionsPanel) {
		throw new UnsupportedOperationException("TODO: auto-generated method stub")
	}
	
	override protected createFormPanel(Panel mainPanel) {
		throw new UnsupportedOperationException("TODO: auto-generated method stub")
	}
	
}


class BuscadorApp extends Application{
	static def void main(String[] args){
		new BuscadorApp().start()
	}
	
	override protected Window<?> createMainWindow(){
		return new BuscadorPoiWindow(this, new BusquedaUI)
	}
}