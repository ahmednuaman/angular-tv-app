require.config
  shim:
    angular:
      exports: 'angular'
  paths:
    angular: '../components/angular/angular'

define [], () ->
  ngApp: 'tv-app'
  path:
    partial: 'app/partial/'