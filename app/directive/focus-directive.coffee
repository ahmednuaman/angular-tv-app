define [
  'config'
  'angular'
], (cfg, A) ->
  FocusDirective = () ->

    link: ($scope, $element, $attrs) ->
      $attrs.$observe 'focus', (first) ->
        if first is 'true'
          $element[0].focus()

  app = A.module cfg.ngApp
  app.directive 'focus', FocusDirective