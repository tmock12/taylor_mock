const path = require('path');
const glob = require('glob');
const MiniCssExtractPlugin = require('mini-css-extract-plugin');
const CopyWebpackPlugin = require('copy-webpack-plugin');
const CssMinimizerPlugin = require('css-minimizer-webpack-plugin');

module.exports = (env, options) => {
  const devMode = options.mode !== 'production';

  return {
    entry: {
      app: glob.sync('./vendor/**/*.js').concat(['./js/app.js']),
    },
    output: {
      path: path.resolve(__dirname, '../priv/static/js'),
      filename: '[name].js',
      publicPath: '/js/',
      hashFunction: 'xxhash64',
    },
    module: {
      rules: [
        {
          test: /\.js$/,
          exclude: /node_modules/,
          use: {
            loader: 'babel-loader',
          },
        },
        {
          test: /\.[s]?css$/,
          use: [
            MiniCssExtractPlugin.loader,
            'css-loader',
            'sass-loader',
            'postcss-loader',
          ],
        },
      ],
    },
    plugins: [
      new MiniCssExtractPlugin({ filename: '../css/app.css' }),
      new CopyWebpackPlugin({
        patterns: [{ from: 'static/', to: '../' }],
      }),
    ],
    optimization: {
      minimizer: ['...', new CssMinimizerPlugin()],
    },
    devtool: devMode ? 'source-map' : undefined,
  };
};
