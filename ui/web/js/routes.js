
poiApp.config(function ($stateProvider, $urlRouterProvider) {

 $urlRouterProvider.otherwise("home");

 $stateProvider
   .state('home', {
     url: "/home",
     controller: "buscadorCtrl as buscadorCtrl",
     cache: false
   })
   .state('detalleComun',{
    url:"/detalleComun",
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
     cache: false,
      views: {
            '': {
              templateUrl: "partials/modalBanco.html",
              controller: "detalleBancoCtrl as detalleBancoCtrl",
              cache: false
            },
            'dirServ@detalleComun.banco': {
              templateUrl: "partials/direccion-servicios.html",
              controller: "direccionServiciosCtrl as dirServCtrl",
              cache: false
            }
     }
   })
    .state('detalleComun.cgp', {
     url: "/cgp/:id",
     cache: false,
     views: {
      '': {
        templateUrl: "partials/modalCgp.html",
        controller: "detalleCgpCtrl as detalleCgpCtrl",
        cache: false,
      },
            'dirServ@detalleComun.cgp': {
              templateUrl: "partials/direccion-servicios.html",
              controller: "direccionServiciosCtrl as dirServCtrl",
              cache: false
            }
            //,'horarios@detalleComun.cgp':{
             // templateUrl: "partial/horariosCgp.html",
             // controller: "horariosCgpCtrl as horariosCgpCtrl",
             // cache: false
           // }

     }
   });
   
});
