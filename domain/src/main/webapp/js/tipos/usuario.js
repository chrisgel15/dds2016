function Usuario(nombre , password, id)
{
	this.nombre = nombre;
	this.password = password;
	this.id = id;
}

function Review(idUsuario, comentario, puntaje)
{
	this.idUsuario = idUsuario;
	this.comentario = comentario;
	this.puntaje = puntaje;

}

Review.asReview = function (jsonReview) {
  return angular.extend(new Review(jsonReview.usuario.id,jsonReview.comentario, jsonReview.puntaje), jsonReview);
};