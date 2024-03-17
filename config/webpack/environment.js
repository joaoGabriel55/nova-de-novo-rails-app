const { environment } = require("@rails/webpacker");

const config = {
  mode: "production", // "production" | "development" | "none"
  resolve: {
    extensions: ["*", ".mjs", ".js", ".json"],
  },
  module: {
    rules: [
      {
        test: /\.mjs$/,
        include: /node_modules/,
        type: "javascript/auto",
      },
    ],
  },
};

environment.config.merge(config);

module.exports = environment;
