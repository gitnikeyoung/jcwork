const path = require('path');
const HtmlWebpackPlugin = require('html-webpack-plugin');
const CleanWebpackPlugin = require('clean-webpack-plugin');

module.exports = {
  mode:"development",
  entry: {
  	app:'./src/index.js',
  	print:'./src/script/prints.js'
  },
  devtool: 'inline-source-map',
  devServer: {
     contentBase: path.join(__dirname, "dist"),
     compress: true,
     inline: true ,
  },
  output: {
    filename: 'script/[name].bundle.js',
    path: path.resolve(__dirname, 'dist/'),
    publicPath: '/'
  },
  plugins: [
     new CleanWebpackPlugin(['dist']),
     new HtmlWebpackPlugin({
       title: 'Output Management',
       template:'index.html',
       inject:true,
       chunks:['app'],
     })
   ],
};