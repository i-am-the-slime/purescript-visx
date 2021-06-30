const scale = require("@visx/scale")

exports.scaleLinearImpl = scale.scaleLinear
exports.scaleBandImpl = scale.scaleBand

exports.bandwidth = (bandScale) => bandScale.bandwidth

exports.scaleValueImpl = (scale) => (x) => () => scale(x)
