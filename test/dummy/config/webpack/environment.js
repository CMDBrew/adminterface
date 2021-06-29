const { environment } = require('@rails/webpacker')
const jquery = require('./plugins/jquery')

environment.loaders.get('sass').use.splice(-1, 0, {
  loader: 'resolve-url-loader'
})

environment.plugins.prepend('jquery', jquery)
module.exports = environment
