process.env.NODE_ENV = process.env.NODE_ENV || 'development'

const environment = require('./environment')

module.exports = environment.toWebpackConfig()
module.exports = {
  entry: {
    application: './app/javascript/controllers/application.js'
    // You can add more entries if needed
  },
  // other settings like output, module, plugins etc.
};