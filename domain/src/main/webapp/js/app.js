'use strict';
var poiApp = angular.module("poiApp", ['ui.router']);

poiApp.controller('buscadorCtrl', function($stateParams, $state, PoiService, $rootScope, UsuariosService) {
	this.buscadorPois = new BuscadorPois($stateParams, $state, PoiService, $rootScope, UsuariosService);
});

poiApp.controller('detalleColectivoCtrl', function($stateParams, $state, PoiService) {
	this.detalleColectivo = new DetalleColectivo($stateParams, $state, PoiService);
});

poiApp.controller('detalleCgpCtrl', function($stateParams, $state, PoiService) {
	this.detalleCgp = new DetalleCgp($stateParams, $state, PoiService);
});



// ********** Para detectar errores de ruteo ********* ///////////////

angular.module("poiApp").run(['$rootScope',function($rootScope){ 

$rootScope.$on('$stateChangeStart',function(event, toState, toParams, fromState, fromParams){
  console.log('$stateChangeStart to '+toState.to+'- fired when the transition begins. toState,toParams : \n',toState, toParams);
});
// $rootScope.$on('$stateChangeError',function(event, toState, toParams, fromState, fromParams, error){
//   console.log('$stateChangeError - fired when an error occurs during transition.');
//   console.log(arguments);
// });
$rootScope.$on('$stateChangeSuccess',function(event, toState, toParams, fromState, fromParams){
  console.log('$stateChangeSuccess to '+toState.name+'- fired once the state transition is complete.');
});
$rootScope.$on('$viewContentLoading',function(event, viewConfig){
   console.log('$viewContentLoading - view begins loading - dom not rendered',viewConfig);
});
 $rootScope.$on('$viewContentLoaded',function(event){
//    runs on individual scopes, so putting it in "run" doesn't work.
   console.log('$viewContentLoaded - fired after dom rendered',event);
});
$rootScope.$on('$stateNotFound',function(event, unfoundState, fromState, fromParams){
  console.log('$stateNotFound '+unfoundState.to+'  - fired when a state cannot be found by its name.');
  console.log(unfoundState, fromState, fromParams);
});

}]);





