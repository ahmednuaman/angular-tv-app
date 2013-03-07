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
      @$scope.items = items

    handleMenuItemsFailure: () ->
      console.log 'Error'

  app = A.module cfg.ngApp
  app.controller 'MenuController', MenuController