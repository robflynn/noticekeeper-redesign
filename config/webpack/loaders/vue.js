const path =  require('path')

const { dev_server: devServer } = require('@rails/webpacker').config

const isProduction = process.env.NODE_ENV === 'production'
const inDevServer = process.argv.find(v => v.includes('webpack-dev-server'))
const extractCSS = !(inDevServer && (devServer && devServer.hmr)) || isProduction

module.exports = {
  test: /\.vue(\.erb)?$/,
  use: [{
    loader: 'vue-loader',
    options: { 
      extractCSS,
      loaders: {
        scss: [
          'vue-style-loader', 
          {
            loader: 'css-loader',
            options: {
              minimize: isProduction,
              sourceMap: !isProduction
            }
          },
          'sass-loader',
          {
            loader: 'sass-resources-loader',
            options: {
              resources: path.join(__dirname, '../variable.scss')
            },
          },
        ]
      }
    }
  }]
}
