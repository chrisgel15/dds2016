package poi

import java.util.List

class ProcesoTres extends Proceso implements IProceso {
	List<TouchMe> usuarios
	List<IAccionCommand> AccionsCommands
	
	new (List<TouchMe> usuarios, List<IAccionCommand> AccionsCommands){
		this.usuarios = usuarios
		this.AccionsCommands = AccionsCommands
	}
	
	def void asignarAcciones(){
		usuarios.forEach[ usu | asignarAcciones(usu)]
	}
	
	def void asignarAcciones(TouchMe usuario){
		this.AccionsCommands.forEach[ acc | usuario.listCommads.add(acc)]
	}
	
	def void ejecutarProcesoTres(){
		this.asignarAcciones()
	}
	
	override Ejecutar() {
		try
		{
			this.ejecutarProcesoTres()
			
		}
		catch (Exception ex)
		{
			
		}
	}
	
}