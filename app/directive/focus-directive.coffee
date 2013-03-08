FocusDirective = ($timeout) ->

  link: ($scope, $element, $attrs) ->
    applyFocus = () ->
      $element[0].focus()

    $attrs.$observe 'focus', (first) ->
      if first is 'true'
        $timeout applyFocus, 100

FocusDirective.$inject = ['$timeout']

app.directive 'focus', FocusDirective