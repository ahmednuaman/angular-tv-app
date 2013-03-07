define [
  'config',
  'angular'
], (cfg, A) ->
  KeyHandlerDirective = (appController) ->

    link: ($scope, $element, $attrs) ->
      # so here we'd use AL.control.observeKeyEvents instead but first imma
      # just use $element.bind 'keydown' yo
      $element.bind 'keydown', (event) ->
        switch event.keyCode
          when 38, 29460
            console.log 'up'
            appController.moveFocusTo $attrs 'keyUp'

          when 40, 29461
            console.log 'down'
            appController.moveFocusTo $attrs 'keyDown'

          when 37, 4
            console.log 'left'
            appController.moveFocusTo $attrs 'keyLeft'

          when 39, 5
            console.log 'right'
            appController.moveFocusTo $attrs 'keyRight'

          when 13, 29443
            console.log 'select that sheeeeeet'
            $element.trigger 'click'

  KeyHandlerDirective.$inject = ['AppController']

  app = A.module cfg.ngApp
  app.directive 'keyHandler', KeyHandlerDirective