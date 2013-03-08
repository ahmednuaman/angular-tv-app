define [
  'config',
  'angular'
], (cfg, A) ->
  class AppController
    @$inject = ['$scope']

    constructor: (@$scope) ->

  app = A.module cfg.ngApp
  app.controller 'AppController', AppController