class MenuController
  @$inject = ['$scope', 'MenuService']

  constructor: (@$scope, @menuService) ->
    @$scope.template = config.path.partial + 'menu-partial.html'

    @addMenuItems()

  addMenuItems: () ->
    success = angular.bind @, @handleMenuItemsSuccess
    failure = angular.bind @, @handleMenuItemsFailure

    @menuService.getMenuItems()
    .then success, failure

  handleMenuItemsSuccess: (items) ->
    keys = [0...items.length] # just so we can haz an array of indexes
    @$scope.items = items
    @$scope.itemsKeyLeft = keys.slice(-1).concat(keys.slice(0)) # forgive me
    @$scope.itemsKeyRight = keys.slice(1).concat(keys.slice(0)) # forgive me

  handleMenuItemsFailure: () ->
    console.log 'Error'

app.controller 'MenuController', MenuController