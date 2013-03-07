define [
  'config'
  'angular'
], (cfg, A) ->
  class HomeController
    @$inject = ['$scope', '$location']

    constructor: (@$scope, @$location) ->
      @addLocationToView()

    addLocationToView: () ->
      @$scope.location = @$location.path()

  app = A.module cfg.ngApp
  app.controller 'HomeController', HomeController