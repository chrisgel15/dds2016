'use strict';

angular.module('poi-app', ['ui.router'])
  .config(function($stateProvider, $urlRouterProvider) {
    $urlRouterProvider.otherwise('/');
    .stateProvider.state('home', {
            url:'/',
            template: '<h1>Home</h1>'
    });
    .stateProvider.state('layout', {
            url:'/app/layout',
            template:'layout.html'
    });
    .stateProvider.state('login', {
            url: '/app/login',
            template: 'login.html'
    });
});
