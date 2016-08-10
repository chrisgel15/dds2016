package poi_ui_arena

import org.uqbar.arena.Application
import org.uqbar.arena.layout.HorizontalLayout
import org.uqbar.arena.layout.VerticalLayout
import org.uqbar.arena.widgets.Button
import org.uqbar.arena.widgets.Label
import org.uqbar.arena.widgets.Panel
import org.uqbar.arena.widgets.tables.Column
import org.uqbar.arena.widgets.tables.Table
import org.uqbar.arena.windows.ErrorsPanel
import org.uqbar.arena.windows.SimpleWindow
import org.uqbar.arena.windows.Window
import org.uqbar.arena.windows.WindowOwner
import poi.BusquedaUI
import poi.CriterioBusqueda

import static extension org.uqbar.arena.xtend.ArenaXtendExtensions.*

class BuscadorPoiWindow extends SimpleWindow<BusquedaUI>{
	new(WindowOwner owner, BusquedaUI modelo){
		super(owner,modelo)
		title = "Búsqueda"
		
	}
	
	override createContents(Panel mainPanel){
		new ErrorsPanel(mainPanel,"Búsqueda")
		new Label(mainPanel).text = "Criterio de búsqueda"
		
		val panelBusqueda = new Panel(mainPanel)
		panelBusqueda.layout = new HorizontalLayout
		
		val panelTextoBusqueda = new Panel(panelBusqueda)
		panelTextoBusqueda.layout = new VerticalLayout
		//new Label(panelTextoBusqueda).text = "Nombre"
		
		//Crear grilla para poner los criterios de busqueda
		val criterioBusqueda = new Table<CriterioBusqueda>(panelTextoBusqueda,typeof(CriterioBusqueda)) =>[
			items <=> "criterios"
		]
		new Column<CriterioBusqueda>(criterioBusqueda) => [
			title = "Nombre"
			fixedSize = 100
			bindContentsToProperty("criterioBusqueda")
			]
		
		//Boton agregar
		new Button(panelBusqueda) =>[
			caption = "Agregar"
			onClick  [| 				
				val window = new CriterioWindow(this,modelObject)
				window.open
			]
		]
		
		//Boton Buscar
		new Button(panelBusqueda) => [
			caption = "Buscar"
			onClick()[|
			 //modelObject.buscar()
			 modelObject.borrarCriterio()
			 ]
		]
		
		new Label(mainPanel).text = "Resultado"
		
		//Crear grilla para traer los resultados de la busqueda
		val tablaDeResultados = new Table<BusquedaUI>(mainPanel,typeof(BusquedaUI)) => [
			
			numberVisibleRows = 10
		]
		
		new Column<BusquedaUI>(tablaDeResultados) => [
			title = "Nombre"
			fixedSize = 300
			
			]
		new Column<BusquedaUI>(tablaDeResultados) => [
			title = "Dirección"
			fixedSize = 300
			]
		
		
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