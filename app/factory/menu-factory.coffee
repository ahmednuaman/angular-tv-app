define [
  'config'
  'angular'
], (cfg, A) ->
  MenuFactory = () ->
    parseResponse: (response) ->
      that = @
      items = []

      A.forEach response, (item) ->
        that.verifyLink item
        items.push item

      items

    verifyLink: (item) ->
      index = item.link.indexOf 'http://'

      if index is -1
        item.link = 'http://' + item.link

  app = A.module cfg.ngApp
  app.factory 'MenuFactory', MenuFactory