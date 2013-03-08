define [
  'config'
  'angular'
  'sizzle'
], (cfg, A, $) ->
  KeyHandlerDirective = () ->

    moveFocusTo = (target, index) ->
      # check to see if the target is of a 'dynamic' or a CSS3 selector
      # usually 'dynamic' targets are outside the current scope
      dynamic = target.indexOf('dynamic: ') is 0

      if dynamic
        # now we know who our parent is, we just need to find its current index
        # and work out which parent is up/down according to their index
        # we expect our dynamic attr to be like 'dynamic: leaveUp#home-partial'
        # so let's split it out and find our direction and parent
        target = target.replace 'dynamic: ', ''
        target = target.split '#'
        direction = target[0]
        parent = $ '#' + target[1] # forgive me

        # find the current parent's index
        parentIndex = Number parent[0].getAttribute 'data-index'

        # now find our div.focus-parent and work out which one is the new parent
        # usually these will exist at a high level since we can specify targets
        # within our views with ids
        parents = $ 'div.focus-parent'
        parentsLength = parents.length - 1

        if direction is 'leaveUp' # sorries
          parentIndex--

        else
          parentIndex++

        if parentIndex < 0
          parentIndex = parentsLength

        else if parentIndex > parentsLength
          parentIndex = 0

        parent = parents[parentIndex]

        # now we can haz our parent let's select it and find all a.key-handler
        # and select on according to index
        keyHandlers = $ 'a.key-handler', parent
        keyHandlersLength = keyHandlers.length - 1

        # if index > keyHandlersLength then we just got for the last one
        # since we control the indexes provided to the key handlers before a
        # key is pressed on them then we can specify roughtly where they go
        # in the next partial
        if index > keyHandlersLength
          index = keyHandlersLength

        keyHandler = keyHandlers[index]
        keyHandler.focus()

      else
        # we _can't_ do this as angular doesn't implement jqLite selectors
        # element = A.element target
        # element[0].focus()
        # so we can haz use sizzle (which abilities has shown us is the fastest)
        element = $ target
        element[0].focus()

    link: ($scope, $element, $attrs) ->
      # first we wanna make sure that this element can haz focus so we add
      # 'key-handler' to its classes
      $element.addClass 'key-handler'

      # so here we'd use AL.control.observeKeyEvents instead but first imma
      # just use $element.bind 'keydown' yo
      $element.bind 'keydown', (event) ->
        switch event.keyCode
          when 38, 29460
            console.log 'up'
            moveFocusTo $attrs['keyUp'], $attrs['index']

          when 40, 29461
            console.log 'down'
            moveFocusTo $attrs['keyDown'], $attrs['index']

          when 37, 4
            console.log 'left'
            moveFocusTo $attrs['keyLeft'], $attrs['index']

          when 39, 5
            console.log 'right'
            moveFocusTo $attrs['keyRight'], $attrs['index']

          when 13, 29443
            console.log 'select that sheeeeeet'
            $element.trigger 'click'

  app = A.module cfg.ngApp
  app.directive 'keyHandler', KeyHandlerDirective