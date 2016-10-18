package poi

//import poi.Factories.PointFactory
//import poi.Factories.ComunaFactory
//import poi.Factories.ServiciosFactory

class PoiBootstrap {
	
	PointFactory pointFactory// = new PointFactory
	ComunaFactory comunaFactory// = new ComunaFactory
	ServiciosFactory servicioFactory// = new ServiciosFactory
	
	
	def void initBancos(){
		var banco1 = new Banco(pointFactory.puntoBancoSantander, "Banco Santander Rio")
		banco1.AgregaServicio(servicioFactory.servicioBanco1)
		banco1.direccion = "Rivadavia 1234"
		banco1.imagenUrl = "imagenes/banco_santander.jpg"
		banco1.zona = "Zona centro"
		//this.create(banco1)
		
		var banco2 = new Banco(pointFactory.puntoBancoSantander, "Banco Frances")
		banco2.AgregaServicio(servicioFactory.servicioBanco1)
		banco2.AgregaServicio(servicioFactory.servicioBanco2)
		banco2.direccion = "Lavalle 4321"
		banco2.imagenUrl = "imagenes/banco_frances.jpg"
		banco2.zona = "Zona norte"
		//this.create(banco2)
		
		var banco3 = new Banco(pointFactory.puntoBancoSantander, "Banco Galicia")
		banco3.AgregaServicio(servicioFactory.servicioBanco1)
		banco3.AgregaServicio(servicioFactory.servicioBanco2)
		banco3.AgregaServicio(servicioFactory.servicioBanco3)
		banco3.direccion = "Cordoba 2222"
		banco3.imagenUrl = "imagenes/banco_galicia.jpg"
		banco3.zona = "Zona oeste"
		//this.create(banco3)
		
		var banco4 = new Banco(pointFactory.puntoBancoSantander, "Banco ICBC")
		banco4.AgregaServicio(servicioFactory.servicioBanco4)
		banco4.direccion = "Rivadavia 3333"
		banco4.imagenUrl = "imagenes/banco_icbc.jpg"
		banco4.zona = "Zona Capital"
		//this.create(banco4)
		
		var banco5 = new Banco(pointFactory.puntoBancoSantander, "Banco Nacion")
		banco5.direccion = "Avenida de Mayo 5454"
		banco5.imagenUrl = "imagenes/banco_nacion.jpg"
		banco5.zona = "Zona GBA"
		//this.create(banco5)
		
		crearBancos(banco1)
		crearBancos(banco2)
		crearBancos(banco3)
		crearBancos(banco4)
		crearBancos(banco5)
		
		}
		
	def void initCgps(){
		
		var cgp1 = new CGP(pointFactory.puntoCgp, "CGP Barrio caballito", comunaFactory.comuna13)
		cgp1.direccion = "Chacabuco 678"
		cgp1.imagenUrl = "imagenes/cgp_1.jpg"
		cgp1.AgregaServicio(servicioFactory.servicioCGP1)
		//this.create(cgp1)
		
		var cgp2 = new CGP(pointFactory.puntoCgp, "CGP balvanera", comunaFactory.comunaAlmagro)
		cgp2.direccion = "Castelli 0000"
		cgp2.imagenUrl = "imagenes/cgp_1.jpg"
		cgp2.AgregaServicio(servicioFactory.servicioCGP2)
		cgp2.AgregaServicio(servicioFactory.servicioCGP4)
		cgp2.AgregaServicio(servicioFactory.servicioCGP5)
		//this.create(cgp2)
		
		var cgp3 = new CGP(pointFactory.puntoCgp, "CGP flores 32", comunaFactory.comuna13)
		cgp3.direccion = "Pueyrredon 3467"
		cgp3.imagenUrl = "imagenes/cgp_1.jpg"
		cgp3.AgregaServicio(servicioFactory.servicioCGP3)
		cgp3.AgregaServicio(servicioFactory.servicioCGP4)
		//this.create(cgp3)
		crearCgps(cgp1)
		crearCgps(cgp2)
		crearCgps(cgp3)
		}
		
	def void initColectivos(){
		
		var colectivo1 = new ParadaColectivo(pointFactory.puntoCero, "Colectivo linea 132")
		colectivo1.direccion = "Acoyte y Rivadavia"
		colectivo1.imagenUrl = "imagenes/linea132.jpg"
		//this.create(colectivo1)
		
		var colectivo2 = new ParadaColectivo(pointFactory.puntoCero, "Colectivo linea 98")
		colectivo2.direccion = "Estacion Once"
		colectivo2.imagenUrl = "imagenes/linea132.jpg"
		//this.create(colectivo2)
		
		var colectivo3 = new ParadaColectivo(pointFactory.puntoCero, "Colectivo linea 441")
		colectivo3.direccion = "Videla y Trole"
		colectivo3.imagenUrl = "imagenes/linea132.jpg"
		//this.create(colectivo3)
		
		crearColectivos(colectivo1)
		crearColectivos(colectivo2)
		crearColectivos(colectivo3)
		}
		
		def void initUsuarios(){
			var user1 = new Usuario("christiangelman@gmail.com", "abc123")
			var user2 = new Usuario("chrisgel15@hotmail.com", "abc123")
			var user3 = new Usuario("rominacuadra@gmail.com", "abc123")
			var user4 = new Usuario("federicomandri@hotmail.com", "abc123")
			var user5 = new Usuario("juanpabloferreira@gmail.com", "abc123")
			var user6 = new Usuario("kenchi@gmail.com", "abc123")
			
			crearUsuarios(user1)
			crearUsuarios(user2)
			crearUsuarios(user3)
			crearUsuarios(user4)
			crearUsuarios(user5)
			crearUsuarios(user6)
		}
		
	def void crearColectivos(ParadaColectivo colectivo) {
		val repoPois = RepositorioPoi.instance
		val listaColectivos = repoPois.searchByExample(colectivo)
		if (listaColectivos.isEmpty) {
			repoPois.create(colectivo)
		// println("Candidato " + partido.nombre + " creado")
		} else {
			val colectivoBD = listaColectivos.head
			colectivo.id = colectivoBD.id
			repoPois.update(colectivo)
		}
	}
	
	
	def void crearCgps(CGP cgp) {
		val repoPois = RepositorioPoi.instance
		val listaCgps = repoPois.searchByExample(cgp)
		if (listaCgps.isEmpty) {
			repoPois.create(cgp)
		// println("Candidato " + partido.nombre + " creado")
		} else {
			val cgpBD = listaCgps.head
			cgp.id = cgpBD.id
			repoPois.update(cgp)
		}
	}
	
	def void crearBancos(Banco banco) {
		val repoPois = RepositorioPoi.instance
		val listaBancos = repoPois.searchByExample(banco)
		if (listaBancos.isEmpty) {
			repoPois.create(banco)
		// println("Candidato " + partido.nombre + " creado")
		} else {
			val bancoBD = listaBancos.head
			banco.id = bancoBD.id
			repoPois.update(banco)
		}
	}
	
	def void crearUsuarios(Usuario user) {
		val repoUsers = RepositorioUsuarios.instance
		val listaUsers = repoUsers.searchByExample(user)
		if (listaUsers.isEmpty) {
			repoUsers.create(user)
		// println("Candidato " + partido.nombre + " creado")
		} else {
			val userBD = listaUsers.head
			user.id = userBD.id
			repoUsers.update(user)
		}
	}
	
	new(){
		pointFactory = new PointFactory
		comunaFactory = new ComunaFactory
		servicioFactory = new ServiciosFactory
		initBancos()
		initCgps()
		initColectivos()
		initUsuarios()
	}
	
	
}

 