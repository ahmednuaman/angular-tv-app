define [
  'config',
  'angular'
], (cfg, A) ->
  KeyHandlerDirective = () ->

    link: ($scope, $element, $attrs) ->
      # so here we'd use AL.control.observeKeyEvents instead but first imma
      # just use $element.bind 'keydown' yo
      $element.bind 'keydown', (event) ->
        switch event.keyCode
          when 38, 29460
            console.log 'up'

          when 40, 29461
            console.log 'down'

          when 37, 4
            console.log 'left'

          when 39, 5
            console.log 'right'

          when 13, 29443
            console.log 'select that sheeeeeet'



  app = A.module cfg.ngApp
  app.directive 'keyHandler', KeyHandlerDirective