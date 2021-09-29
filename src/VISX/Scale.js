const scale = require("@visx/scale");

exports.scaleLinearImpl = scale.scaleLinear;
exports.scaleBandImpl = scale.scaleBand;
exports.scaleQuantizeImpl = scale.scaleQuantize;
exports.scaleOrdinalImpl = scale.scaleOrdinal;
exports.scaleTimeImpl = scale.scaleTime;
// exports.scaleUtcImpl = scale.scaleUtc;

exports.bandwidth = (bandScale) => bandScale.bandwidth;

exports.scaleValueImpl = (scale) => (x) => () => scale(x);
exports.invertValueImpl = (scale) => (x) => () => scale.invert(x);
