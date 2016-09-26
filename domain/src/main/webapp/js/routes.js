poiApp.config(function($stateProvider, $urlRouterProvider) {

    $urlRouterProvider.otherwise('/login');

    $stateProvider
        .state('login', {
            url: '/login',
            templateUrl: "partials/login.html",
            controller: "loginCtrl as loginCtrl",
            cache: false
        })
        .state('home', {
            url: "/home",
            cache: false,
            views: {
                '': {
                    templateUrl: 'partials/buscador.html',
                    controller: "buscadorCtrl as buscadorCtrl",
                    cache: false
                }
            }
        })
        // Vista compartida por todos los Pois
        .state('home.detalleComun', {
            url: "/detalle",
            cache: false,
            params: { 'id':null },
            resolve: {
              DetallePoi: ['$stateParams','DetallePoiService', function($stateParams,DetallePoiService){
                return DetallePoiService.buscarDetalleById($stateParams);
              }]
            },
            views: {
             'detalle': { templateUrl: "partials/detalleComun.html",
              controller: "detalleComunCtrl as detalleComunCtrl",
              cache: false }
          }
        })
        // Vista del detalle del colectivo
        .state('home.detalleComun.colectivo', {
            url: "/colectivo/:id",
            cache: false,
            views: {
              'detalleParticular': {
                  templateUrl: "partials/modalColectivo.html",
                  controller: "detalleColectivoCtrl as detalleColectivoCtrl",
                  cache: false
                }
          }
        })
        // Vista del detalle del banco
        .state('home.detalleComun.banco', {
            url: "/banco/:id",
            cache: false,
            params: { 'id':null },
            resolve: {
              MostrarHorario: function(){
                return {'mostrar': false};
              }
            },
            views: {
                'detalleParticular': {
                    templateUrl: "partials/modalBanco.html",
                    controller: "detalleBancoCtrl as detalleBancoCtrl",
                    cache: false
                },
                'dirServ@home.detalleComun.banco': {
                    templateUrl: "partials/direccion-servicios.html",
                    controller: "direccionServiciosCtrl as dirServCtrl",
                    cache: false
                }
            }
        })
        // Vista del detalle del CGP
        .state('home.detalleComun.cgp', {
            url: "/cgp/:id",
            cache: false,
             resolve: {
              MostrarHorario: function(){
                return {'mostrar': true};
              }
            },
            views: {
                'detalleParticular': {
                    templateUrl: "partials/modalCgp.html",
                    controller: "detalleCgpCtrl as detalleCgpCtrl",
                    cache: false,
                },
                'dirServ@home.detalleComun.cgp': {
                    templateUrl: "partials/direccion-servicios.html",
                    controller: "direccionServiciosCtrl as dirServCtrl",
                    cache: false
                }
            }
        });
});