const { environment } = require('@rails/webpacker')
const webpack = require('webpack')

environment.loaders.get('sass').use.splice(-1, 0, {
  loader: 'resolve-url-loader'
})

module.exports = environment
