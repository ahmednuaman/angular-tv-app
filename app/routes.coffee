class Routes

  constructor: () ->

    routes = ($routeProvider) ->
      $routeProvider.when '/home',
        controller: 'HomeController'
        templateUrl: config.path.partial + 'home-partial.html'

      $routeProvider.otherwise
        redirectTo: '/home'

    routes.$inject = ['$routeProvider']
    routes.$eager = true

    app.config routes

    angular.bootstrap document, [config.ngApp]

$(document).ready () ->
  new Routes()