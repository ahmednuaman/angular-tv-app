define [
  'config'
  'angular'
  # 'directive/section-carousel'
  # 'directive/section-carousel-item'
  # 'directive/selected-menu-link'
  # 'factory/carousel-factory'
  # 'factory/menu-factory'
  # 'factory/keys-factory'
  # 'service/carousel-service'
  # 'service/menu-service'
  # 'controller/menu-controller'
  'controller/home-controller'
  # 'controller/subsection-controller'
  # 'controller/section-controller'
], (cfg, A, HomeController) ->
  routes = ($routeProvider) ->
    $routeProvider.when '/home',
      controller: HomeController.$name
      templateUrl: cfg.path.partial + 'home-partial.html'

    $routeProvider.otherwise
      redirectTo: '/home'

  routes.$inject = ['$routeProvider']
  routes.$eager = true

  app = A.module cfg.ngApp
  app.config routes

  A.bootstrap document, [cfg.ngApp]