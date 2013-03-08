class HomeController
  @$inject = ['$scope', '$location']

  constructor: (@$scope, @$location) ->
    @addLocationToView()

  addLocationToView: () ->
    links = [0...10]
    @$scope.links = links
    @$scope.linksKeyLeft = links.slice(-1).concat(links.slice(0)) # forgive me
    @$scope.linksKeyRight = links.slice(1).concat(links.slice(0)) # forgive me
    @$scope.location = @$location.path()

app.controller 'HomeController', HomeController