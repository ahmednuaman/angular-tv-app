define [
  'config'
  'angular'
  'sizzle'
], (cfg, A, $) ->
  KeyHandlerDirective = () ->

    moveFocusTo = (target) ->
      # check to see if the target is of a 'dynamic' or a CSS3 selector
      # usually 'dynamic' targets are outside the current scope
      dynamic = target.indexOf('dynamic: ') is 0

      if dynamic
        # meh

      else
        # we _can't_ do this as angular doesn't implement jqLite selectors
        # element = A.element target
        # element[0].focus()
        # so we can haz use sizzle (which abilities has shown us is the fastest)
        element = $ target
        element[0].focus()

    link: ($scope, $element, $attrs) ->
      # so here we'd use AL.control.observeKeyEvents instead but first imma
      # just use $element.bind 'keydown' yo
      $element.bind 'keydown', (event) ->
        switch event.keyCode
          when 38, 29460
            console.log 'up'
            moveFocusTo $attrs['keyUp']

          when 40, 29461
            console.log 'down'
            moveFocusTo $attrs['keyDown']

          when 37, 4
            console.log 'left'
            moveFocusTo $attrs['keyLeft']

          when 39, 5
            console.log 'right'
            moveFocusTo $attrs['keyRight']

          when 13, 29443
            console.log 'select that sheeeeeet'
            $element.trigger 'click'

  app = A.module cfg.ngApp
  app.directive 'keyHandler', KeyHandlerDirective