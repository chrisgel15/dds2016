function Usuario(nombre , password, id, favoritos)
{
	var self = this;

	self.nombre = nombre;
	self.password = password;
	self.id = id;
	self.favoritos = favoritos;

	self.marcarFavorito = function (idPoi) {
			if (_.includes(self.favoritos, idPoi,0))
				self.favoritos.pop(idPoi);
			else
				self.favoritos.push(idPoi);
	};
}

Usuario.asUsuario = function(jsonUsuario) {
	return angular.extend(new Usuario(jsonUsuario.nombre, jsonUsuario.password, jsonUsuario.id, jsonUsuario.favoritosId));
};

function Review(idUsuario, comentario, puntaje, nombre)
{
	this.idUsuario = idUsuario;
	this.comentario = comentario;
	this.puntaje = puntaje;
	this.nombre = nombre;

}

Review.asReview = function (jsonReview) {
  return angular.extend(new Review(jsonReview.usuario.id,jsonReview.comentario, jsonReview.puntaje, 
  							jsonReview.usuario.nombre), jsonReview);
};