package poi_ui_arena

import org.uqbar.arena.layout.HorizontalLayout
import org.uqbar.arena.widgets.Button
import org.uqbar.arena.widgets.Label
import org.uqbar.arena.widgets.Panel
import org.uqbar.arena.widgets.TextBox
import org.uqbar.arena.windows.SimpleWindow
import org.uqbar.arena.windows.WindowOwner
import poi.BusquedaUI

import static extension org.uqbar.arena.xtend.ArenaXtendExtensions.*

class CriterioWindow extends SimpleWindow<BusquedaUI>{
	new(WindowOwner owner, BusquedaUI modelo){
		super(owner,modelo)
		title = "Agregar Criterio de Búsqueda"
		
	}
	
	override createContents(Panel mainPanel){
		new Label(mainPanel).text = "Ingrese el nuevo criterio para la búsqueda"
		new TextBox(mainPanel) => [
			value <=> "textoBusqueda"
		]
		
		val botonera = layoutHorizontal(mainPanel)
		crearBotonesAccion(botonera)

	}
	
	
	def layoutHorizontal(Panel unPanel){
		val panelH = new Panel(unPanel)
		panelH.layout = new HorizontalLayout
	}
	
	def crearBotonesAccion(Panel unPanel){
		new Button(unPanel) => [
			caption = "Aceptar"
			onClick()[| 
				modelObject.AgregarCriterio()
				close
			]
		]
		new Button(unPanel) => [
			caption = "Cancelar"
			onClick() [| close]
		]
	}
	
	override protected addActions(Panel actionsPanel) {
		throw new UnsupportedOperationException("TODO: auto-generated method stub")
	}
	
	override protected createFormPanel(Panel mainPanel) {
		throw new UnsupportedOperationException("TODO: auto-generated method stub")
	}
	
}