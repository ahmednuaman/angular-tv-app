define [
  'config'
  'angular'
], (cfg, A) ->
  class MenuController
    @$inject = ['$scope', 'MenuService']

    constructor: (@$scope, @menuService) ->
      @$scope.template = cfg.path.partial + 'menu-partial.html'

      @addMenuItems()

    addMenuItems: () ->
      success = A.bind @, @handleMenuItemsSuccess
      failure = A.bind @, @handleMenuItemsFailure

      @menuService.getMenuItems()
      .then success, failure

    handleMenuItemsSuccess: (items) ->
      keys = [0...items.length] # just so we can haz an array of indexes
      @$scope.items = items
      @$scope.itemsKeyLeft = keys.slice(-1).concat(keys.slice(0)) # forgive me
      @$scope.itemsKeyRight = keys.slice(1).concat(keys.slice(0)) # forgive me

    handleMenuItemsFailure: () ->
      console.log 'Error'

  app = A.module cfg.ngApp
  app.controller 'MenuController', MenuController