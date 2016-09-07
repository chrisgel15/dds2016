
poiApp.config(function ($stateProvider, $urlRouterProvider) {

 $urlRouterProvider.otherwise("/home");

 $stateProvider
   .state('home', {
     url: "/home",
     controller: "buscadorCtrl as buscadorCtrl"
   })
   .state('banco', {
     url: "/detalleBanco/:id",
    templateUrl: "partials/modalBanco.html",
     controller: "detalleBancoCtrl as detalleBancoCtrl"
   })
    .state('cgp', {
     url: "/detalleCgp/:id",
    templateUrl: "partials/modalCgp.html",
     controller: "detalleCtrl as detalleCtrl"
   })
     .state('colectivo', {
     url: "/detalleColectivo/:id",
    templateUrl: "partials/modalColectivo.html",
     controller: "detalleColectivoCtrl as detalleColectivoCtrl"
   });
});
