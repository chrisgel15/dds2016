function PoiService($stateParams, $state) {

	var banco1 = new Banco('Banco Santander', 'Calle Falsa 123', 1, 'Banco', 'Zona 1', 'imagenes/banco_santander.jpg');
	banco1.agregarServicio('Cajero Automatico', 'Lunes');
	banco1.agregarServicio('Extraccion', 'Martes');
	banco1.agregarServicio('Extraccion', 'Miercoles');

	var banco2 =  new Banco('Banco Galicia', 'Rivadavia 222', 4,'Banco', 'Zona 2', 'imagenes/banco_galicia.jpg');
	banco2.agregarServicio('Deposito', 'Jueves');
	banco2.agregarServicio('Pagos', 'Viernes');
	banco2.agregarServicio('Pagos', 'Lunes');

	var banco3 = new Banco('Banco Frances', 'Lavalle 767', 5, 'Banco', 'Zona 3', 'imagenes/banco_frances.jpg');
	banco3.agregarServicio('Prestamos', 'Miercoles');
	banco3.agregarServicio('Seguros', 'Lunes a Viernes');
	banco3.agregarServicio('Pagos', 'Martes');

	var bondi1 = new ParadaDeColectivo('Linea 98', 3, 'Colectivo','imagenes/linea98.jpg');
	bondi1.agregarParadas(10);
	var bondi2 = new ParadaDeColectivo('Linea 132', 6, 'Colectivo', 'imagenes/linea132.jpg');
	bondi2.agregarParadas(5);

	var cgp1 = new CGP('CGP Comuna 10', 'direccion 2', 2, 'CGP','imagenes/cgp_1.jpg', 'Comuna 5');
	cgp1.agregarServicio('Servicio cgp', 'Miercoles', 13,14);
	cgp1.agregarServicio('Servicio cgp', 'Jueves', 15, 16);
	cgp1.agregarServicio('Otro servicio', 'Martes', 13, 14);

	this.listaPois = [ banco1,
					cgp1,
						bondi1,
							banco2,
								banco3,
								bondi2		 ];

	
	
	
	this.getPoiById = function (id) {
   		return _.find(this.listaPois, function (poi) {
     		return poi.prototype.id == id;
   		});
	};

	this.getPoi = function () {
		return _.find(this.listaPois, function (poi) {
     		return poi.prototype.id == $stateParams.id;
   		});
	};

}