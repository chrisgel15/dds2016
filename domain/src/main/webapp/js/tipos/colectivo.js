function ParadaDeColectivo(nombre, id, tipo, imagenUrl) {
	this.prototype = new Poi(nombre, id, tipo, imagenUrl);

	this.cantidadParadas = 0;

	this.agregarParadas = function(cantidad){
		this.cantidadParadas = cantidad;
	};
	
 }

// Test
var bondi = new ParadaDeColectivo('linea 20', 1, 'Colectivo');
bondi.agregarParadas(10);
console.log(bondi);