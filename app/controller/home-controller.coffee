define [
  'config'
  'angular'
], (cfg, A) ->
  class HomeController
    @$inject = ['$scope', '$location']
    @$name = 'HomeController'

    constructor: (@$scope, @$location) ->
      @addLocationToView()

    addLocationToView: () ->
      @$scope.location = @$location.path()

  app = A.module cfg.ngApp
  app.controller HomeController.$name, HomeController

  HomeController