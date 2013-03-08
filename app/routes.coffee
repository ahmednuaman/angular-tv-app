class Routes

  constructor: () ->

    routes = ($routeProvider, $locationProvider) ->
      $locationProvider.html5Mode false

      $routeProvider.when '/',
        controller: 'HomeController'
        templateUrl: config.path.partial + 'home-partial.html'

      $routeProvider.otherwise
        redirectTo: '/'

    routes.$inject = ['$routeProvider', '$locationProvider']
    routes.$eager = true

    app.config routes

    angular.bootstrap document, [config.ngApp]

$(document).ready () ->
  new Routes()