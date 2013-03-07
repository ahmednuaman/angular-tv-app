define [
  'config',
  'angular'
], (cfg, A) ->
  class AppController
    @$inject = ['$scope']

    constructor: (@$scope) ->

    moveFocusTo: (target) ->
      console.log target

  app = A.module cfg.ngApp
  app.controller 'AppController', AppController