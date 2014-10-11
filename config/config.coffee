path     = require 'path'
rootPath = path.normalize __dirname + '/..'
env      = process.env.NODE_ENV || 'development'

config =
  development:
    root: rootPath
    app:
      name: 'chitter-node2'
    port: 3000
    db: 'postgres://localhost/chitter_node2_development'
    

  test:
    root: rootPath
    app:
      name: 'chitter-node2'
    port: 3000
    db: 'postgres://localhost/chitter_node2_test'
    

  production:
    root: rootPath
    app:
      name: 'chitter-node2'
    port: 3000
    db: 'postgres://localhost/chitter_node2_production'
    

module.exports = config[env]
