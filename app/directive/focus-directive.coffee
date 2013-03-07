define [
  'config',
  'angular'
], (cfg, A) ->
  FocusDirective = () ->

    link: ($scope, $element, $attrs) ->
      $attrs.$observe 'focusDirective', (first) ->
        if first is 'true'
          $element[0].focus()

  app = A.module cfg.ngApp
  app.directive 'focusDirective', FocusDirective