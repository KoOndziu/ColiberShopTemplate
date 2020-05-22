var path = require('path');
var webpack = require('webpack');
var MiniCss = require("mini-css-extract-plugin");

module.exports = {

  mode: 'production',
  devtool: 'source-map',
  plugins: [
    new MiniCss({
      filename: '../css/theme.css'
    })
  ],
  entry: [
    './js/theme.js',
    './css/normalize.css',
    './css/theme.scss'
  ],
  output: {
    path: path.resolve('../assets/js'),
    filename: 'theme.js'
  },
  module: {
    rules:  [{
      test: /\.js/,
      exclude: /node_modules/,
      loaders: ['babel-loader']
    }, {
      test: /\.scss$/,
      exclude: /node_modules/,
      use: [
        { loader: MiniCss.loader },
        'css-loader',
        'sass-loader',
        'import-glob-loader'
      ]
    }, {
      test: /\.css$/,
      exclude: /node_modules/,
      use: [
        { loader: MiniCss.loader },
        'css-loader'
      ]
    }, {
      test: /.(png|woff(2)?|eot|ttf|svg|jpg)(\?[a-z0-9=\.]+)?$/,
      exclude: /node_modules/,
      loader: 'file-loader?name=../fonts/[name].[ext]'
    }]
  },
  externals: {
    prestashop: 'prestashop',
    $: '$',
    jquery: 'jQuery'
  },
  resolve: {
    extensions: ['.js', '.scss', '.css']
  }
};
