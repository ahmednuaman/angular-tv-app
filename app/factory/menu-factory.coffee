MenuFactory = () ->
  parseResponse: (response) ->
    that = @
    items = []

    angular.forEach response, (item) ->
      that.verifyLink item
      items.push item

    items

  verifyLink: (item) ->
    index = item.link.indexOf 'http://'

    if index is -1
      item.link = 'http://' + item.link

app.factory 'MenuFactory', MenuFactory