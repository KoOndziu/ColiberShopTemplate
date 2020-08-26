/** 
 * 2019-2020 Konrad Kubala <000konrad000@gmail.com>
 * 
 * NOTICE OF LICENSE
 * 
 * This source file is subject to the AFL-3.0
 * that is bundled with this package in the file LICENSE.txt.
 * 
 * @author    Konrad Kubala <000konrad000@gmail.com>
 * @copyright 2007-2020 Konrad Kubala <000konrad000@gmail.com>
 * @license   AFL-3.0
 */

var path = require('path');
var webpack = require('webpack');
var MiniCss = require("mini-css-extract-plugin");

module.exports = {

  mode: 'production',
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
      test: /\.js$/,
      use: {
        loader: 'babel-loader',
        options: {
          presets: ['@babel/preset-env']
        }
      }
    }, {
      test: /\.scss$/,
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
