const { environment } = require('@rails/webpacker')

// @TODO: hotfix for: ValidationError: Invalid options object. PostCSS Loader has been initialized using an options object that does not match the API schema
// https://github.com/rails/webpacker/issues/2784#issuecomment-730636299
environment.loaders.keys().forEach(loaderName => {
  const loader = environment.loaders.get(loaderName)
  loader.use.forEach(loaderConfig => {
    if (loaderConfig.options && loaderConfig.options.config) {
      loaderConfig.options.postcssOptions = loaderConfig.options.config
      delete loaderConfig.options.config
    }
  })
})

environment.loaders.get('sass').use.splice(-1, 0, {
  loader: 'resolve-url-loader'
})

module.exports = environment
