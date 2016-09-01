
function BuscadorPois() {
	this.nombre = [];

	this.nuevoCriterio = "";

	this.agregarCriterio = function(){
		if (this.nuevoCriterio != "" && this.nombre.indexOf(this.nuevoCriterio) == -1){
			this.nombre.push(this.nuevoCriterio);
		}
		this.nuevoCriterio = "";
	};

	this.limpiarCriterios = function(){
		this.nombre = [];
	};
}
