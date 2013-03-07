define [
  'config'
  'angular'
  'controller/home-controller'
  'controller/menu-controller'
  'factory/menu-factory'
  'service/menu-service'
], (cfg, A) ->
  routes = ($routeProvider) ->
    $routeProvider.when '/home',
      controller: 'HomeController'
      templateUrl: cfg.path.partial + 'home-partial.html'

    $routeProvider.otherwise
      redirectTo: '/home'

  routes.$inject = ['$routeProvider']
  routes.$eager = true

  app = A.module cfg.ngApp
  app.config routes

  A.bootstrap document, [cfg.ngApp]