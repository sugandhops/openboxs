const path = require('path');

const ROOT = path.resolve(__dirname, 'src');
const SRC = path.resolve(ROOT, 'js');
const DEST = path.resolve(__dirname, 'web-app');
const ASSETS = path.resolve(ROOT, 'assets');
const JS_DEST = path.resolve(__dirname, 'web-app/js');
const CSS_DEST = path.resolve(__dirname, 'web-app/css');
const GRAILS_VIEWS = path.resolve(__dirname, 'grails-app/views');
const COMMON_VIEW = path.resolve(GRAILS_VIEWS, 'common');
const RECEIVING_VIEW = path.resolve(GRAILS_VIEWS, 'partialReceiving');

const MiniCssExtractPlugin = require('mini-css-extract-plugin');
const OptimizeCSSAssetsPlugin = require('optimize-css-assets-webpack-plugin');
const CleanWebpackPlugin = require('clean-webpack-plugin');
const HtmlWebpackPlugin = require('html-webpack-plugin');

module.exports = {
  entry: {
    app: `${SRC}/index.jsx`,
  },
  output: {
    path: DEST,
    filename: 'js/bundle.[hash].js',
    chunkFilename: 'js/bundle.[hash].[name].js',
    publicPath: '/openboxes-bikash/',
  },
  stats: {
    colors: true,
  },
  plugins: [
    new MiniCssExtractPlugin({
      filename: 'css/bundle.[hash].css',
      chunkFilename: 'css/bundle.[hash].[name].css',
    }),
    new OptimizeCSSAssetsPlugin({}),
    new CleanWebpackPlugin([`${JS_DEST}/bundle.**`, `${CSS_DEST}/bundle.**`]),
    new HtmlWebpackPlugin({
      filename: `${COMMON_VIEW}/_react.gsp`,
      template: `${ASSETS}/grails-template.html`,
      inject: false,
      templateParameters: compilation => ({
        jsSource: `\${createLinkTo(dir:'/js', file:'bundle.${compilation.hash}.js')}`,
        cssSource: `\${createLinkTo(dir:'css/', file:'bundle.${compilation.hash}.css')}`,
        receivingIfStatement: '',
      }),
    }),
    new HtmlWebpackPlugin({
      filename: `${RECEIVING_VIEW}/_create.gsp`,
      template: `${ASSETS}/grails-template.html`,
      inject: false,
      templateParameters: compilation => ({
        jsSource: `\${createLinkTo(dir:'/js', file:'bundle.${compilation.hash}.js')}`,
        cssSource: `\${createLinkTo(dir:'css/', file:'bundle.${compilation.hash}.css')}`,
        receivingIfStatement:
          // eslint-disable-next-line no-template-curly-in-string
          '<g:if test="${!params.id}">' +
          'You can access the Partial Receiving feature through the details page for an inbound shipment.' +
          '</g:if>',
      }),
    }),
  ],
  module: {
    rules: [
      {
        enforce: 'pre',
        test: /\.jsx?$/,
        exclude: /node_modules/,
        loader: 'eslint-loader',
      },
      {
        test: /\.jsx?$/,
        use: ['cache-loader', 'babel-loader?presets[]=@babel/react&presets[]=@babel/env'],
        include: SRC,
        exclude: /node_modules/,
      },
      {
        test: /\.(sa|sc|c)ss$/,
        use: [MiniCssExtractPlugin.loader, 'css-loader', 'sass-loader'],
      },
      {
        test: /\.eot(\?v=\d+\.\d+\.\d+)?$/,
        loader: 'file-loader?name=./fonts/[hash].[ext]',
      },
      {
        test: /\.(woff|woff2)$/,
        loader: 'url-loader?prefix=font/&limit=5000&name=./fonts/[hash].[ext]',
      },
      {
        test: /\.ttf(\?v=\d+\.\d+\.\d+)?$/,
        loader: 'url-loader?limit=10000&mimetype=application/octet-stream&name=./fonts/[hash].[ext]',
      },
      {
        test: /\.svg(\?v=\d+\.\d+\.\d+)?$/,
        loader: 'url-loader?limit=10000&mimetype=image/svg+xml&name=./fonts/[hash].[ext]',
      },
      {
        test: /\.(png|jpg|gif)$/i,
        use: [
          {
            loader: 'url-loader',
            options: {
              limit: 8192,
            },
          },
        ],
      },
    ],
  },
  resolve: {
    alias: {
      root: ROOT,
      src: SRC,
      components: path.resolve(SRC, 'components'),
      hooks: path.resolve(SRC, 'hooks'),
      reducers: path.resolve(SRC, 'reducers'),
      actions: path.resolve(SRC, 'actions'),
      consts: path.resolve(SRC, 'consts'),
      tests: path.resolve(SRC, 'tests'),
      utils: path.resolve(SRC, 'utils'),
      templates: path.resolve(SRC, 'templates'),
      store: path.resolve(SRC, 'store'),
      css: path.resolve(ROOT, 'css'),
      api: path.resolve(SRC, 'api'),
      wrappers: path.resolve(SRC, 'wrappers'),
    },
    extensions: ['.js', '.jsx'],
  },
};
