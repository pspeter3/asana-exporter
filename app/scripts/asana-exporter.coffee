angular.module('asana-exporter', ['ngRoute', 'ngStorage', 'ngCsv'])
  .config ($routeProvider) ->
    $routeProvider
      .when '/',
        templateUrl: '/views/exporter.html'
      .when '/login',
        templateUrl: '/views/splash.html'
      .otherwise
        redirectTo: '/login'
  .run ($rootScope, $location, User) ->
    $rootScope.$on '$routeChangeStart', (event, next, current) ->
      if not User.isAuthenticated() \
        and next.templateUrl isnt '/views/login.html'
          $location.path("/login")