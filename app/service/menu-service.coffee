class MenuService
  @$inject = ['$q', '$http', 'MenuFactory']

  constructor: (@$q, @$http, @menuFactory) ->

  getMenuItems: () ->
    dfd = @$q.defer()
    success = angular.bind @, @handleMenuItemsSuccess, dfd
    failure = angular.bind @, @handleMenuItemsFailure, dfd

    @$http.get('mock/menu.json')
    .success(success)
    .error(failure)

    dfd.promise

  handleMenuItemsSuccess: (dfd, response) ->
    items = @menuFactory.parseResponse response.menu

    dfd.resolve items

  handleMenuItemsFailure: (dfd) ->
    dfd.reject()

app.service 'MenuService', MenuService