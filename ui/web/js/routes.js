
poiApp.config(function ($stateProvider, $urlRouterProvider) {

 $urlRouterProvider.otherwise("home");

 $stateProvider
   .state('home', {
     url: "/home",
     controller: "buscadorCtrl as buscadorCtrl",
     cache: false
   })
   .state('detalleComun',{
    url:"/detalleComun/",
    templateUrl: "partials/detalleComun.html",
    controller: "detalleComunCtrl as detalleComunCtrl",
    cache: false
   })
     .state('detalleComun.colectivo', {
     url: "/colectivo/:id",
    templateUrl: "partials/modalColectivo.html",
     controller: "detalleColectivoCtrl as detalleColectivoCtrl",
     cache: false
   })
   .state('detalleComun.banco', {
     url: "/banco/:id",
    templateUrl: "partials/modalBanco.html",
     controller: "detalleBancoCtrl as detalleBancoCtrl",
     cache: false
   })
    .state('cgp', {
     url: "/detalleCgp/:id",
    templateUrl: "partials/modalCgp.html",
     controller: "detalleCtrl as detalleCtrl",
     cache: false
   })
    .state('detalle', {
      url: "/detalle",
      templateUrl: "partials/modalheader2.html",
      controller: "padreCtrl as padreCtrl",
      cache: false
     });
   
});
