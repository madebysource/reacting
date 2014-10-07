module.exports = {
  entry: "./index.js",
  output: {
      path: __dirname,
      filename: "bundle.js"
  },
	module: {
		loaders: [
			{ test: /\.coffee$/, loader: "coffee" },
      { test: /\.less$/, loader: "style-loader!css-loader!less-loader" }
		]
	},
	resolve: {
		extensions: ["", ".coffee", ".js"]
	}
}
