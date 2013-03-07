define [
  'config'
], (cfg) ->
  require ['angular'], (A) ->
    A.module cfg.ngApp, []

    require ['routes']