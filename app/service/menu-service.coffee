define [
  'config'
  'angular'
], (cfg, A) ->
  class MenuService
    @$inject = ['$q', '$http', 'MenuFactory']

    constructor: (@$q, @$http, @menuFactory) ->

    getMenuItems: () ->
      dfd = @$q.defer()
      success = A.bind @, @handleMenuItemsSuccess, dfd
      failure = A.bind @, @handleMenuItemsFailure, dfd

      @$http.get('mock/menu.json')
      .success(success)
      .error(failure)

      dfd.promise

    handleMenuItemsSuccess: (dfd, response) ->
      items = @menuFactory.parseResponse response.menu

      dfd.resolve items

    handleMenuItemsFailure: (dfd) ->
      dfd.reject()

  app = A.module cfg.ngApp
  app.service 'MenuService', MenuService