files = [
  'factory/menu-factory'
  'service/menu-service'
  'controller/app-controller'
  'controller/home-controller'
  'controller/menu-controller'
  'directive/focus-directive'
  'directive/key-handler-directive'
  'routes'
]

for file in files
  $.getScript config.path.app + file + '.js'