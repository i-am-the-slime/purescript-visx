const glob = require("fast-glob");

module.exports = {
  stories: glob(["./output/Story.*/index.js"]).then((paths) =>
    paths.map((p) => `.${p}`)
  ),
  addons: [],
};
