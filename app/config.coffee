require.config
  urlArgs: 'x=' +  (new Date()).getTime()
  waitSeconds: 1000
  shim:
    angular:
      exports: 'angular'
    sizzle:
      exports: 'sizzle'
  paths:
    angular: '../components/angular/angular'
    sizzle: '../components/sizzle/sizzle'

define [], () ->
  ngApp: 'tv-app'
  path:
    partial: 'app/partial/'