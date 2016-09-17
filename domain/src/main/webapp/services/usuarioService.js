poiApp.service('UsuariosService', function($http) { 

  this.validarCredenciales = function (Usuario, callback, errorHandler) {
    $http.post('/login',Usuario).then(callback, errorHandler);
    
  };
});